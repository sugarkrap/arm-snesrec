/*
 * emit_x86_64.cc -- x86_64 / Win64 backend.
 *
 * Reproduces the original single-file recompiler's output exactly, character
 * for character, so tests/check.sh can prove the agnostic layer changed
 * nothing. Where a choice looked arbitrary it was kept: `0x%02X` vs `0x%04X`
 * vs `0x%X` formatting, two-space indentation, the `[rel sym]` RIP-relative
 * form. Those are load-bearing for the golden diff, not style.
 */
#include <stdarg.h>
#include <stdio.h>

#include "emit.h"

/* Widest view of each virtual register, and the 16/8-bit sub-register views
 * x86 needs for narrow stores. ARM has no equivalent of these views, which is
 * why the interface is at the level of load_sym/store_sym rather than exposing
 * them. */
static const char *R64[VR_COUNT] = { "rcx", "rdx", "rax", "r12", "rbx" };
static const char *R16[VR_COUNT] = { "cx",  "dx",  "ax",  "r12w", "bx" };
static const char *R8 [VR_COUNT] = { "cl",  "dl",  "al",  "r12b", "bl" };

static const char *width_kw(EWidth w)
{
	switch (w) {
	case EW8:  return "byte";
	case EW16: return "word";
	case EW32: return "dword";
	default:   return "qword";
	}
}

static void x_prologue(void)
{
	/* yasm requires every imported symbol to be declared. GNU as does not,
	 * which is exactly why this belongs to the backend and not the driver. */
	printf("extern MapMode, CycleCount\n");
	printf("extern regA, regX, regY, regS, regDP, regDBR\n");
	printf("extern B_Flag, C_Flag, D_Flag, E_Flag, I_Flag\n");
	printf("extern M_Flag, N_Flag, V_Flag, X_Flag, Z_Flag\n");
	printf("extern inNMI, NMI, io_RDNMI, io_NMITIMEN, DoMessages, Render\n");
	printf("extern pc_map, __JUMP_FAILED, __CALL_SHOW, __REG_DUMP, __READ_INS\n");
	printf("extern __UpdateNZ_A8, __UpdateNZ_X8, __UpdateNZ_Y8\n");
	printf("extern __UpdateNZ_A16, __UpdateNZ_X16, __UpdateNZ_Y16\n");
	printf("extern __MVN, __MVP, __REP, __SEP, __XCE, __WDM, __WAI, __PRINT_INS\n");
	printf("extern __TESTNZ8, __TESTNZ16, __COMPARE8, __COMPARE16\n");
	printf("extern __ASL8, __ASL16, __LSR8, __LSR16, __ROR8, __ROR16, __ROL8, __ROL16\n");
	printf("extern __TSB, __TRB, __BIT8, __BIT16, __INC8, __INC16, __ADC8, __ADC16, __SBC8, __SBC16\n");
	printf("extern __PHP, __PLP, __PUSH8, __PUSH16, __PULL8, __PULL16\n");
	printf("extern __WRITE8, __WRITE16, __READ8, __READ16, __READ24\n");
	printf("\n");
	printf("  section .text\n");
}

static void x_global_sym(const char *fmt, ...)
{
	va_list ap;
	printf("  global ");
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
	printf("\n");
}

static void x_label(const char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
	printf(":\n");
}

static void x_mov_reg_imm(VReg d, uint32_t imm)
{
	printf("  mov %s, 0x%X\n", R64[d], imm);
}

static void x_mov_reg_immw(VReg d, uint32_t imm, EWidth w)
{
	if (w == EW8)
		printf("  mov %s, 0x%02X\n", R64[d], imm);
	else if (w == EW16)
		printf("  mov %s, 0x%04X\n", R64[d], imm);
	else if (w == EW24)
		printf("  mov %s, 0x%06X\n", R64[d], imm);
	else if (w == EW32)
		printf("  mov %s, 0x%08X\n", R64[d], imm);
	else
		printf("  mov %s, 0x%X\n", R64[d], imm);
}

static void x_mov_reg_reg(VReg d, VReg s)
{
	printf("  mov %s, %s\n", R64[d], R64[s]);
}

static void x_load_sym(VReg d, const char *sym, EWidth w)
{
	/* movzx is the zero-extending load; a 32-bit read is a plain mov. */
	if (w == EW32)
		printf("  mov %s, [rel %s]\n", R64[d], sym);
	else
		printf("  movzx %s, %s [rel %s]\n", R64[d], width_kw(w), sym);
}

static void x_store_sym(const char *sym, VReg s, EWidth w)
{
	const char *r = (w == EW8) ? R8[s] : (w == EW16) ? R16[s] : R64[s];
	printf("  mov %s [rel %s], %s\n", width_kw(w), sym, r);
}

static void x_store_sym_imm(const char *sym, uint32_t imm, EWidth w)
{
	if (w == EW8)
		printf("  mov byte [rel %s], 0x%02X\n", sym, imm);
	else if (w == EW16)
		printf("  mov word [rel %s], 0x%04X\n", sym, imm);
	else
		printf("  mov qword [rel %s], 0x%X\n", sym, imm);
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

static void x_alu_imm(EAlu op, VReg d, uint32_t imm)
{
	/* Shift counts print bare; the original emitted `shl rcx, 16`, and the
	 * masks print as 0x%X, matching LOAD_DP/LOAD_DBR_ADDR. */
	if (op == EA_SHL || op == EA_SHR)
		printf("  %s %s, %u\n", alu_mnem(op), R64[d], imm);
	else
		printf("  %s %s, 0x%X\n", alu_mnem(op), R64[d], imm);
}

static void x_alu_imm_w(EAlu op, VReg d, uint32_t imm, EWidth w)
{
	if (w == EW8)
		printf("  %s %s, 0x%02X\n", alu_mnem(op), R64[d], imm);
	else if (w == EW16)
		printf("  %s %s, 0x%04X\n", alu_mnem(op), R64[d], imm);
	else if (w == EW24)
		printf("  %s %s, 0x%06X\n", alu_mnem(op), R64[d], imm);
	else
		printf("  %s %s, 0x%X\n", alu_mnem(op), R64[d], imm);
}

static void x_alu_reg(EAlu op, VReg d, VReg s)
{
	printf("  %s %s, %s\n", alu_mnem(op), R64[d], R64[s]);
}

static void x_cmp_imm_w(VReg a, uint32_t imm, EWidth w)
{
	if (w == EW24)
		printf("  cmp %s, 0x%06X\n", R64[a], imm);
	else
		printf("  cmp %s, 0x%X\n", R64[a], imm);
}

static void x_cmp_sym_imm(const char *sym, uint32_t imm, EWidth w)
{
	printf("  cmp %s [rel %s], %u\n", width_kw(w), sym, imm);
}

static void x_cmp_imm(VReg a, uint32_t imm)
{
	printf("  cmp %s, 0x%X\n", R64[a], imm);
}

static void x_set_eq_sym(const char *sym)
{
	printf("  sete byte [rel %s]\n", sym);
}

static void x_jump(ECond c, const char *fmt, ...)
{
	va_list ap;
	printf("  %s ", c == EC_EQ ? "je" : c == EC_NE ? "jne" : "jmp");
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
	printf("\n");
}

static void x_call_sym(const char *sym)
{
	printf("  call %s\n", sym);
}

static void x_call_helper(const char *sym)
{
	/* Win64 requires 32 bytes of shadow space above the return address for
	 * the callee to spill its register arguments into. */
	printf("  sub rsp, 32\n");
	printf("  call %s\n", sym);
	printf("  add rsp, 32\n");
}

static void x_ret(void)
{
	printf("  ret\n");
}

static void x_nop(void)
{
	printf("  nop\n");
}

static void x_frame_enter(void)
{
	/* The call pushed the return address; nothing else to set up. */
}

static void x_frame_return(void)
{
	printf("  ret\n");
}

static void x_frame_discard(void)
{
	printf("  add rsp, 32\n");
	printf("  pop rax ; pop return address\n");
}

static void x_add_sym_imm(const char *sym, int32_t imm, EWidth w)
{
	printf("  add %s [rel %s], %d\n", width_kw(w), sym, imm);
}

static void x_comment(const char *fmt, ...)
{
	va_list ap;
	printf("  ; ");
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
	printf("\n");
}

static void x_raw(const char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	vprintf(fmt, ap);
	va_end(ap);
}

const EmitOps emit_x86_64 = {
	"x86_64",
	x_prologue,
	x_global_sym,
	x_label,
	x_mov_reg_imm,
	x_mov_reg_immw,
	x_mov_reg_reg,
	x_load_sym,
	x_store_sym,
	x_store_sym_imm,
	x_alu_imm,
	x_alu_reg,
	x_alu_imm_w,
	x_cmp_imm,
	x_cmp_sym_imm,
	x_cmp_imm_w,
	x_set_eq_sym,
	x_jump,
	x_call_sym,
	x_call_helper,
	x_ret,
	x_frame_enter,
	x_frame_return,
	x_frame_discard,
	x_nop,
	x_add_sym_imm,
	x_comment,
	x_raw,
};

const EmitOps *E = &emit_x86_64;
