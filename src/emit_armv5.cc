/*
 * emit_armv5.cc -- ARMv5TE backend (GNU as syntax, AAPCS).
 *
 * Target is the Sharp Zaurus SL-C7xx/C860: PXA255, ARMv5TE, soft-float,
 * little-endian.
 *
 * WHAT DIFFERS FROM x86_64, AND WHY THE INTERFACE LOOKS AS IT DOES:
 *
 *  - No memory operands. x86 can `add qword [rel CycleCount], 6`; ARM must
 *    load, modify and store through registers. Every load_sym/store_sym here
 *    therefore expands to two or three instructions, and needs an address
 *    register to hold the symbol's address.
 *  - No 8/16-bit sub-register views. Narrow access is a different instruction
 *    (ldrb/ldrh/strb/strh), not a different name for the same register. This
 *    is why the interface exposes widths on symbol access rather than exposing
 *    register views as x86 does.
 *  - Immediates are an 8-bit value rotated right by an even amount. Most SNES
 *    constants (0xFFFF, bank addresses, 0x808000) are NOT encodable. Rather
 *    than open-code the cases, this backend uses `ldr rX, =value`, the
 *    assembler pseudo-instruction that becomes mov/mvn when the value is
 *    encodable and a PC-relative literal-pool load when it is not. Always
 *    correct, and lets the assembler take the encodable cases.
 *  - AAPCS passes arguments in r0-r3 and needs no shadow space, unlike Win64's
 *    32 bytes -- so call_helper is a bare `bl`.
 *
 * REGISTER ASSIGNMENT (r0-r3 caller-saved, r4+ callee-saved, per AAPCS):
 *
 *      VR_ARG0 -> r0     first argument to a runtime helper
 *      VR_ARG1 -> r1     second argument
 *      VR_TMP  -> r2     scratch, not preserved across a call
 *      VR_SAVE -> r4     preserved across a call (callee-saved)
 *      VR_PC   -> r5     current guest PC (callee-saved)
 *      r3                RESERVED to this backend as the address/constant
 *                        scratch; never mapped to a virtual register, because
 *                        every symbol access needs one and the decoder must
 *                        not be able to clobber it.
 *
 * STATUS: the emission primitives are implemented; the ~1,325 decoder sites
 * still using raw() are not ported, and raw() here emits a loud marker rather
 * than passing x86 text through. Output is therefore not yet assemblable --
 * deliberately so. Silently emitting a mixture would be far worse than failing
 * visibly, and grepping the marker gives the exact remaining work list.
 */
#include <stdarg.h>
#include <stdio.h>

#include "emit.h"

static const char *R[VR_COUNT] = { "r0", "r1", "r2", "r4", "r5" };

#define ADDR_SCRATCH "r3"

static unsigned long a_raw_sites;   /* unported sites seen, reported at end */

static void a_prologue(void)
{
	printf("\t.text\n");
	printf("\t.arch armv5te\n");
	printf("\t.syntax unified\n");
}

static void a_label(const char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
	printf(":\n");
}

static void a_mov_reg_imm(VReg d, uint32_t imm)
{
	printf("\tldr %s, =0x%X\n", R[d], imm);
}

static void a_mov_reg_immw(VReg d, uint32_t imm, EWidth w)
{
	(void)w;   /* ldr= needs no width; the assembler picks the encoding */
	printf("\tldr %s, =0x%X\n", R[d], imm);
}

static void a_mov_reg_reg(VReg d, VReg s)
{
	printf("\tmov %s, %s\n", R[d], R[s]);
}

static const char *ld_mnem(EWidth w)
{
	switch (w) {
	case EW8:  return "ldrb";   /* zero-extends */
	case EW16: return "ldrh";   /* zero-extends */
	default:   return "ldr";
	}
}

static const char *st_mnem(EWidth w)
{
	switch (w) {
	case EW8:  return "strb";
	case EW16: return "strh";
	default:   return "str";
	}
}

static void a_load_sym(VReg d, const char *sym, EWidth w)
{
	printf("\tldr " ADDR_SCRATCH ", =%s\n", sym);
	printf("\t%s %s, [" ADDR_SCRATCH "]\n", ld_mnem(w), R[d]);
}

static void a_store_sym(const char *sym, VReg s, EWidth w)
{
	printf("\tldr " ADDR_SCRATCH ", =%s\n", sym);
	printf("\t%s %s, [" ADDR_SCRATCH "]\n", st_mnem(w), R[s]);
}

static void a_store_sym_imm(const char *sym, uint32_t imm, EWidth w)
{
	/* Needs two scratches: one for the address, one for the value. r12 (ip)
	 * is call-clobbered and unused by our register map, so it is free here. */
	printf("\tldr " ADDR_SCRATCH ", =%s\n", sym);
	printf("\tldr ip, =0x%X\n", imm);
	printf("\t%s ip, [" ADDR_SCRATCH "]\n", st_mnem(w));
}

static const char *alu_mnem(EAlu op)
{
	switch (op) {
	case EA_ADD: return "add";
	case EA_SUB: return "sub";
	case EA_AND: return "and";
	case EA_OR:  return "orr";     /* ARM spells it orr */
	case EA_XOR: return "eor";     /* and xor is eor */
	case EA_SHL: return "lsl";
	default:     return "lsr";
	}
}

static void a_alu_imm(EAlu op, VReg d, uint32_t imm)
{
	if (op == EA_SHL || op == EA_SHR) {
		printf("\t%s %s, %s, #%u\n", alu_mnem(op), R[d], R[d], imm);
		return;
	}
	/* Route the constant through ldr= so unencodable immediates (0xFFFF,
	 * 0x808000, ...) assemble rather than failing. */
	printf("\tldr " ADDR_SCRATCH ", =0x%X\n", imm);
	printf("\t%s %s, %s, " ADDR_SCRATCH "\n", alu_mnem(op), R[d], R[d]);
}

static void a_alu_reg(EAlu op, VReg d, VReg s)
{
	printf("\t%s %s, %s, %s\n", alu_mnem(op), R[d], R[d], R[s]);
}

static void a_cmp_imm(VReg a, uint32_t imm)
{
	printf("\tldr " ADDR_SCRATCH ", =0x%X\n", imm);
	printf("\tcmp %s, " ADDR_SCRATCH "\n", R[a]);
}

/*
 * `ldr rX, =value` places the constant in a literal pool that must sit within
 * +-4KB of the load, and the assembler will only create one where we say. Long
 * runs of generated code overflow that range -- the assembler reports "invalid
 * literal constant: pool needs to be closer", which is how this was found.
 *
 * A pool is DATA: dropping one mid-stream would be executed as instructions.
 * So they go only where control flow cannot fall through -- immediately after
 * an unconditional branch or a return.
 */
static void a_ltorg(void)
{
	printf("\t.ltorg\n");
}

static void a_jump(ECond c, const char *fmt, ...)
{
	va_list ap;
	printf("\t%s ", c == EC_EQ ? "beq" : c == EC_NE ? "bne" : "b");
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
	printf("\n");
	if (c == EC_ALWAYS)
		a_ltorg();     /* safe: nothing falls through an unconditional b */
}

/* decode.cc reads a call's result out of VR_TMP -- true on x86_64 because rax
 * is both VR_TMP and the return register, but AAPCS returns in r0 (VR_ARG0),
 * not r2 (VR_TMP). Copy it over so the two backends agree; r2 is scratch, so
 * clobbering it here is always safe even when the result goes unused. */
static void a_call_sym(const char *sym)
{
	printf("\tbl %s\n", sym);
	printf("\tmov r2, r0\n");
}

static void a_call_helper(const char *sym)
{
	/* AAPCS needs no shadow space, so this is the same as a bare call. The
	 * distinction is kept because Win64 does need it. */
	printf("\tbl %s\n", sym);
	printf("\tmov r2, r0\n");
}

static void a_ret(void)
{
	printf("\tbx lr\n");
	a_ltorg();         /* safe: nothing falls through a return */
}

static void a_nop(void)
{
	/* ARMv5 has no dedicated NOP encoding; this is the conventional no-op. */
	printf("\tmov r0, r0\n");
}

static void a_add_sym_imm(const char *sym, int32_t imm, EWidth w)
{
	printf("\tldr " ADDR_SCRATCH ", =%s\n", sym);
	if (w == EW64) {
		/*
		 * CycleCount is 64-bit and ARM32 has no 64-bit add: low word with
		 * carry out, then high word with carry in. Getting this wrong would
		 * corrupt the cycle counter only after 2^32 cycles, i.e. it would
		 * look fine for a long time and then not -- worth being explicit.
		 */
		printf("\tldr r0, [" ADDR_SCRATCH "]\n");
		printf("\tldr r1, [" ADDR_SCRATCH ", #4]\n");
		printf("\tadds r0, r0, #%d\n", imm);
		printf("\tadc r1, r1, #0\n");
		printf("\tstr r0, [" ADDR_SCRATCH "]\n");
		printf("\tstr r1, [" ADDR_SCRATCH ", #4]\n");
		return;
	}
	printf("\t%s ip, [" ADDR_SCRATCH "]\n", ld_mnem(w));
	printf("\tadd ip, ip, #%d\n", imm);
	printf("\t%s ip, [" ADDR_SCRATCH "]\n", st_mnem(w));
}

static void a_comment(const char *fmt, ...)
{
	va_list ap;
	printf("\t@ ");
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
	printf("\n");
}

static void a_raw(const char *fmt, ...)
{
	va_list ap;
	char buf[512];

	/*
	 * An unported site. Emit a marker and the original x86 text as a comment,
	 * NEVER the text itself: passing it through would produce output that
	 * looks assemblable and is silently wrong for this target. This way the
	 * remaining work is `grep -c UNPORTED` and each instance points at what
	 * still needs a real ARM encoding.
	 */
	va_start(ap, fmt);
	vsnprintf(buf, sizeof(buf), fmt, ap);
	va_end(ap);

	/* strip the trailing newline the x86 sites embed */
	for (char *p = buf; *p; p++)
		if (*p == '\n') { *p = ' '; }

	a_raw_sites++;
	printf("\t.error \"UNPORTED x86: %s\"\n", buf);
}

unsigned long armv5_unported_sites(void)
{
	return a_raw_sites;
}

const EmitOps emit_armv5 = {
	"armv5",
	a_prologue,
	a_label,
	a_mov_reg_imm,
	a_mov_reg_immw,
	a_mov_reg_reg,
	a_load_sym,
	a_store_sym,
	a_store_sym_imm,
	a_alu_imm,
	a_alu_reg,
	a_cmp_imm,
	a_jump,
	a_call_sym,
	a_call_helper,
	a_ret,
	a_nop,
	a_add_sym_imm,
	a_comment,
	a_raw,
};
