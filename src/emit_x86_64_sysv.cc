/*
 * emit_x86_64_sysv.cc -- x86_64 System V backend (GNU as, Intel syntax).
 *
 * The original x86_64 backend targets Win64 and NASM, which means its output
 * cannot be built or run on Linux at all: wrong ABI, and a syntax the system
 * assembler does not speak. This backend exists so the pipeline can be tested
 * natively on a build host rather than only under qemu.
 *
 * WHAT DIFFERS FROM WIN64:
 *
 *  - Argument registers. Win64 passes the first two integer arguments in rcx
 *    and rdx; System V uses rdi and rsi. VR_TMP stays rax, which is the return
 *    register in both, so decode.cc reading a call's result out of VR_TMP
 *    needs no fixup here (unlike ARM, where AAPCS returns in r0 = VR_ARG0).
 *
 *  - No shadow space. Win64 reserves 32 bytes above the return address for the
 *    callee to spill its register arguments into; System V has none. What it
 *    has instead is a STACK ALIGNMENT rule, handled below.
 *
 *  - GNU as, Intel syntax. Same assembler as the ARM backend. RIP-relative
 *    addressing is `[rip + sym]` rather than NASM's `[rel sym]`, and memory
 *    operands need an explicit `ptr` size.
 *
 * REGISTER ASSIGNMENT:
 *
 *      VR_ARG0 -> rdi    first argument to a runtime helper
 *      VR_ARG1 -> rsi    second argument
 *      VR_TMP  -> rax    scratch, and the return register
 *      VR_SAVE -> r12    callee-saved
 *      VR_PC   -> rbx    callee-saved
 */
#include <stdarg.h>
#include <stdio.h>

#include "emit.h"

static const char *R64[VR_COUNT] = { "rdi",  "rsi",  "rax", "r12",  "rbx" };
static const char *R32[VR_COUNT] = { "edi",  "esi",  "eax", "r12d", "ebx" };
static const char *R16[VR_COUNT] = { "di",   "si",   "ax",  "r12w", "bx"  };
static const char *R8 [VR_COUNT] = { "dil",  "sil",  "al",  "r12b", "bl"  };

static const char *width_ptr(EWidth w)
{
	switch (w) {
	case EW8:  return "byte ptr";
	case EW16: return "word ptr";
	case EW32: return "dword ptr";
	default:   return "qword ptr";
	}
}

/* yasm spells a function-local label ".name"; GNU as reads a leading dot as a
 * directive, so they become ".Lname" -- exactly as in the ARM backend. */
static void put_label(const char *fmt, va_list ap)
{
	char buf[256];

	vsnprintf(buf, sizeof(buf), fmt, ap);
	if (buf[0] == '.')
		printf(".L%s", buf + 1);
	else
		printf("%s", buf);
}

static void s_prologue(void)
{
	/* GNU as needs no import declarations, so unlike the NASM backend there
	 * is no extern block here. */
	printf("\t.text\n");
	printf("\t.intel_syntax noprefix\n");
	printf("\t.section .note.GNU-stack,\"\",@progbits\n");
	printf("\t.text\n");
}

static void s_global_sym(const char *fmt, ...)
{
	va_list ap;
	printf("\t.globl ");
	va_start(ap, fmt);
	put_label(fmt, ap);
	va_end(ap);
	printf("\n");
}

static void s_label(const char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	put_label(fmt, ap);
	va_end(ap);
	printf(":\n");
}

static void s_mov_reg_imm(VReg d, uint32_t imm)
{
	printf("\tmov %s, 0x%X\n", R64[d], imm);
}

static void s_mov_reg_immw(VReg d, uint32_t imm, EWidth w)
{
	if (w == EW8)
		printf("\tmov %s, 0x%02X\n", R64[d], imm);
	else if (w == EW16)
		printf("\tmov %s, 0x%04X\n", R64[d], imm);
	else if (w == EW24)
		printf("\tmov %s, 0x%06X\n", R64[d], imm);
	else if (w == EW32)
		printf("\tmov %s, 0x%08X\n", R64[d], imm);
	else
		printf("\tmov %s, 0x%X\n", R64[d], imm);
}

static void s_mov_reg_reg(VReg d, VReg s)
{
	printf("\tmov %s, %s\n", R64[d], R64[s]);
}

static void s_load_sym(VReg d, const char *sym, EWidth w)
{
	if (w == EW32)
		printf("\tmov %s, dword ptr [rip + %s]\n", R32[d], sym);
	else if (w == EW64)
		printf("\tmov %s, qword ptr [rip + %s]\n", R64[d], sym);
	else
		printf("\tmovzx %s, %s [rip + %s]\n", R64[d], width_ptr(w), sym);
}

static void s_store_sym(const char *sym, VReg s, EWidth w)
{
	const char *r = (w == EW8) ? R8[s] : (w == EW16) ? R16[s]
	              : (w == EW32) ? R32[s] : R64[s];
	printf("\tmov %s [rip + %s], %s\n", width_ptr(w), sym, r);
}

static void s_store_sym_imm(const char *sym, uint32_t imm, EWidth w)
{
	if (w == EW8)
		printf("\tmov byte ptr [rip + %s], 0x%02X\n", sym, imm);
	else if (w == EW16)
		printf("\tmov word ptr [rip + %s], 0x%04X\n", sym, imm);
	else
		printf("\tmov qword ptr [rip + %s], 0x%X\n", sym, imm);
}

static const char *alu_mnem(EAlu op)
{
	switch (op) {
	case EA_ADD: return "add";
	case EA_SUB: return "sub";
	case EA_AND: return "and";
	case EA_OR:  return "or";
	case EA_XOR: return "xor";
	case EA_SHL: return "shl";
	default:     return "shr";
	}
}

static void s_alu_imm(EAlu op, VReg d, uint32_t imm)
{
	if (op == EA_SHL || op == EA_SHR)
		printf("\t%s %s, %u\n", alu_mnem(op), R64[d], imm);
	else
		printf("\t%s %s, 0x%X\n", alu_mnem(op), R64[d], imm);
}

static void s_alu_imm_w(EAlu op, VReg d, uint32_t imm, EWidth w)
{
	if (w == EW8)
		printf("\t%s %s, 0x%02X\n", alu_mnem(op), R64[d], imm);
	else if (w == EW16)
		printf("\t%s %s, 0x%04X\n", alu_mnem(op), R64[d], imm);
	else if (w == EW24)
		printf("\t%s %s, 0x%06X\n", alu_mnem(op), R64[d], imm);
	else
		printf("\t%s %s, 0x%X\n", alu_mnem(op), R64[d], imm);
}

static void s_alu_reg(EAlu op, VReg d, VReg s)
{
	printf("\t%s %s, %s\n", alu_mnem(op), R64[d], R64[s]);
}

static void s_cmp_imm(VReg a, uint32_t imm)
{
	printf("\tcmp %s, 0x%X\n", R64[a], imm);
}

static void s_cmp_imm_w(VReg a, uint32_t imm, EWidth w)
{
	if (w == EW24)
		printf("\tcmp %s, 0x%06X\n", R64[a], imm);
	else if (w == EW32)
		/* 32-bit view on purpose: compares a uint32_t returned by a helper,
		 * whose upper half the ABI leaves undefined. */
		printf("\tcmp %s, 0x%08X\n", R32[a], imm);
	else
		printf("\tcmp %s, 0x%X\n", R64[a], imm);
}

static void s_cmp_sym_imm(const char *sym, uint32_t imm, EWidth w)
{
	printf("\tcmp %s [rip + %s], %u\n", width_ptr(w), sym, imm);
}

static void s_set_eq_sym(const char *sym)
{
	printf("\tsete byte ptr [rip + %s]\n", sym);
}

static void s_jump(ECond c, const char *fmt, ...)
{
	va_list ap;
	printf("\t%s ", c == EC_EQ ? "je" : c == EC_NE ? "jne" : "jmp");
	va_start(ap, fmt);
	put_label(fmt, ap);
	va_end(ap);
	printf("\n");
}

static void s_call_sym(const char *sym)
{
	printf("\tcall %s\n", sym);
}

/*
 * STACK ALIGNMENT.
 *
 * System V requires rsp to be 16-byte aligned at the point of a `call`, so the
 * callee sees rsp % 16 == 8 on entry. Generated code is entered by a call from
 * main (or reached by jmp from another generated block, which does not change
 * rsp), so throughout it rsp % 16 == 8 -- 8 short of what a call needs.
 *
 * Hence the 8-byte pad. It is the direct counterpart of Win64's 32 bytes of
 * shadow space, and it is not optional: gcc-compiled helpers may use aligned
 * SSE moves, which fault on a misaligned stack rather than degrading quietly.
 */
static void s_call_helper(const char *sym)
{
	printf("\tsub rsp, 8\n");
	printf("\tcall %s\n", sym);
	printf("\tadd rsp, 8\n");
}

static void s_ret(void)
{
	printf("\tret\n");
}

static void s_frame_enter(void)
{
	/* The call pushed the return address; nothing else to set up. */
}

static void s_frame_return(void)
{
	printf("\tret\n");
}

static void s_frame_discard(void)
{
	/* Abandon the frame and tail-jump: undo the caller's alignment pad, then
	 * drop the return address. Win64 undoes 32 bytes of shadow space here for
	 * exactly the same reason. */
	printf("\tadd rsp, 8\n");
	printf("\tpop rax\n");
}

static void s_nop(void)
{
	printf("\tnop\n");
}

static void s_add_sym_imm(const char *sym, int32_t imm, EWidth w)
{
	printf("\tadd %s [rip + %s], %d\n", width_ptr(w), sym, imm);
}

static void s_comment(const char *fmt, ...)
{
	va_list ap;
	printf("\t# ");
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
	printf("\n");
}

static unsigned long s_raw_sites;

static void s_raw(const char *fmt, ...)
{
	va_list ap;
	char buf[512];
	char *p;

	va_start(ap, fmt);
	vsnprintf(buf, sizeof(buf), fmt, ap);
	va_end(ap);
	for (p = buf; *p; p++)
		if (*p == '\n') *p = ' ';

	s_raw_sites++;
	printf("\t.error \"UNPORTED x86: %s\"\n", buf);
}

unsigned long sysv_unported_sites(void)
{
	return s_raw_sites;
}

const EmitOps emit_x86_64_sysv = {
	"x86_64-sysv",
	s_prologue,
	s_global_sym,
	s_label,
	s_mov_reg_imm,
	s_mov_reg_immw,
	s_mov_reg_reg,
	s_load_sym,
	s_store_sym,
	s_store_sym_imm,
	s_alu_imm,
	s_alu_reg,
	s_alu_imm_w,
	s_cmp_imm,
	s_cmp_sym_imm,
	s_cmp_imm_w,
	s_set_eq_sym,
	s_jump,
	s_call_sym,
	s_call_helper,
	s_ret,
	s_frame_enter,
	s_frame_return,
	s_frame_discard,
	s_nop,
	s_add_sym_imm,
	s_comment,
	s_raw,
};
