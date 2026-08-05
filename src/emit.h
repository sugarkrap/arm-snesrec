/*
 * emit.h -- target-agnostic host code emission.
 *
 * The decoder used to write x86_64 text directly (`printf("  mov rcx, ...")`)
 * and to pass host register names around as strings. Everything it needs now
 * goes through the EmitOps table below, so decode.cc names no host register
 * and no host mnemonic, and a second target is a matter of filling in another
 * table.
 *
 * WHY A VIRTUAL REGISTER SET RATHER THAN A 1:1 INSTRUCTION MAPPING. x86_64 and
 * ARMv5 are too far apart for the latter: x86 ALU ops take memory operands and
 * 8/16-bit sub-register views, ARM does neither -- every ARM access is
 * load/modify/store through a register, and its immediates are an 8-bit value
 * rotated by an even amount rather than an arbitrary 32-bit constant. So this
 * interface sits at the level of "load this symbol, zero-extended, into a
 * virtual register", which both targets can express, rather than at "movzx",
 * which only one can.
 *
 * The five virtual registers come from what the original actually used,
 * counted across the whole decoder: rcx 800 uses as helper argument and
 * general workhorse, rax 373 as scratch, rdx 206 as second argument, r12 98 as
 * a value preserved across a call, rbx 43 holding the current guest PC.
 *
 *      virtual   x86_64 (Win64)   ARMv5 (AAPCS)
 *      VR_ARG0   rcx              r0    first argument to a helper
 *      VR_ARG1   rdx              r1    second argument
 *      VR_TMP    rax              r2    scratch, not preserved
 *      VR_SAVE   r12              r4    preserved across a call
 *      VR_PC     rbx              r5    current guest PC
 *
 * ON raw(): an escape hatch for the sites not yet ported off direct x86 text,
 * so the port can proceed incrementally rather than as one unreviewable
 * rewrite. The ARMv5 backend deliberately turns raw() into a loud marker in
 * its output instead of passing it through -- an unported site must be visibly
 * broken on ARM, never silently wrong.
 */
#ifndef SNESREC_EMIT_H
#define SNESREC_EMIT_H

#include <stdio.h>
#include <stdint.h>

typedef enum {
	VR_ARG0 = 0,
	VR_ARG1,
	VR_TMP,
	VR_SAVE,
	VR_PC,
	VR_COUNT
} VReg;

/* Access width for a guest-state symbol. The SNES register file mixes 8- and
 * 16-bit values and reads are always zero-extending. */
/* Byte width of a value. EW24 exists because a SNES address is 24-bit: the
 * original emitted those as "0x%06X", and without a width meaning "24-bit" a
 * PC below 0x100000 would print unpadded and silently differ from the text the
 * recompiler used to produce. The fixture's PCs are all >= 0x800000, so that
 * discrepancy is invisible to the golden -- hence spelling it out here. */
typedef enum { EW8 = 1, EW16 = 2, EW24 = 3, EW32 = 4, EW64 = 8 } EWidth;

typedef enum { EA_ADD, EA_SUB, EA_AND, EA_OR, EA_XOR, EA_SHL, EA_SHR } EAlu;
typedef enum { EC_ALWAYS, EC_EQ, EC_NE } ECond;

typedef struct EmitOps {
	const char *name;

	void (*prologue)(void);                 /* externs + section directive */
	void (*label)(const char *fmt, ...);

	void (*mov_reg_imm)(VReg d, uint32_t imm);
	/* same, but zero-padded to width w on x86 (matches the original's mixed
	 * 0x%02X/%04X literals); ARM ignores w since ldr=/mov take one form. */
	void (*mov_reg_immw)(VReg d, uint32_t imm, EWidth w);
	void (*mov_reg_reg)(VReg d, VReg s);

	void (*load_sym)(VReg d, const char *sym, EWidth w);   /* zero-extending */
	void (*store_sym)(const char *sym, VReg s, EWidth w);
	void (*store_sym_imm)(const char *sym, uint32_t imm, EWidth w);

	void (*alu_imm)(EAlu op, VReg d, uint32_t imm);
	void (*alu_reg)(EAlu op, VReg d, VReg s);

	/* alu_imm, but with the constant printed at a fixed width. Same reason
	 * EW24 exists: "or rax, 0x%06X" against a bank must not silently become
	 * "or rax, 0x0" for bank 0. Only the sites that need the padding use it. */
	void (*alu_imm_w)(EAlu op, VReg d, uint32_t imm, EWidth w);
	void (*cmp_imm)(VReg a, uint32_t imm);

	/* Compare a guest-state symbol directly against a constant. x86 does this
	 * in one instruction against memory; ARM must load first. Kept as its own
	 * primitive rather than load_sym + cmp_imm so the x86 form stays a single
	 * instruction and neither backend has to clobber a virtual register to
	 * test a flag. Every conditional branch uses it: cmp byte [rel Z_Flag], 0 */
	void (*cmp_sym_imm)(const char *sym, uint32_t imm, EWidth w);

	/* store 1 into sym (a byte) if the preceding cmp_imm compared equal, else
	 * store 0. Used for BIT #imm, which sets only Z from a value that never
	 * gets written back anywhere else. */
	void (*set_eq_sym)(const char *sym);

	void (*jump)(ECond c, const char *fmt, ...);

	/* call_sym is a bare call; call_helper adds whatever the host ABI needs
	 * around it (Win64 wants 32 bytes of shadow space, AAPCS wants none). */
	void (*call_sym)(const char *sym);
	void (*call_helper)(const char *sym);
	void (*ret)(void);
	void (*nop)(void);

	void (*add_sym_imm)(const char *sym, int32_t imm, EWidth w);  /* cycles */

	void (*comment)(const char *fmt, ...);
	void (*raw)(const char *fmt, ...);      /* not yet ported; see above */
} EmitOps;

extern const EmitOps emit_x86_64;
extern const EmitOps emit_armv5;
extern const EmitOps *E;          /* selected backend; defaults to x86_64 */

/*
 * The vocabulary the 65816 decoder speaks. Each is a SNES-level operation, not
 * a host instruction.
 */
#define CALL_FUNCTION_STK(FNAME)  E->call_helper(FNAME)
#define CALL_FUNCTION(FNAME)      E->call_sym(FNAME)
#define ADD_CYCLES(cycles)        E->add_sym_imm("CycleCount", (cycles), EW64)

#define UPDATE_NZ_A(M) E->call_sym((M) ? "__UpdateNZ_A8" : "__UpdateNZ_A16")
#define UPDATE_NZ_X(X) E->call_sym((X) ? "__UpdateNZ_X8" : "__UpdateNZ_X16")
#define UPDATE_NZ_Y(X) E->call_sym((X) ? "__UpdateNZ_Y8" : "__UpdateNZ_Y16")

/* NOTE: REG here is a guest-state SYMBOL (e.g. "I_Flag"), not a register. The
 * original macro name is misleading; kept to limit churn at 15 call sites. */
#define MOV_REG8_IMM(REG, IMM)   E->store_sym_imm(REG, (IMM), EW8)
#define MOV_REG16_IMM(REG, IMM)  E->store_sym_imm(REG, (IMM), EW16)

#define LOAD_IMM(REG, IMM)       E->mov_reg_imm(REG, (IMM))

/* effective address = (DBR << 16) + addr */
#define LOAD_DBR_ADDR(REG, ADDR)          \
	do {                                  \
		E->load_sym(REG, "regDBR", EW8);  \
		E->alu_imm(EA_SHL, REG, 16);      \
		E->alu_imm(EA_ADD, REG, (ADDR));  \
	} while (0)

/* direct page: (DP + offset), wrapped to bank 0 */
#define LOAD_DP(REG, OFFSET)                \
	do {                                    \
		E->load_sym(REG, "regDP", EW16);    \
		E->alu_imm(EA_ADD, REG, (OFFSET));  \
		E->alu_imm(EA_AND, REG, 0xFFFF);    \
	} while (0)

/* stack relative: S + offset */
#define LOAD_SR(REG, OFFSET)                \
	do {                                    \
		E->load_sym(REG, "regS", EW16);     \
		E->alu_imm(EA_ADD, REG, (OFFSET));  \
	} while (0)

/* add an index register, honouring the current index width. `ca` is the
 * CodeAddr in scope at the call site -- inherited from the original macro. */
#define APPLY_IDX_OFFSET(REGDST, REGSRC, IDX)            \
	do {                                                 \
		E->load_sym(REGSRC, IDX, EW16);                  \
		if (ca.X) { E->alu_imm(EA_AND, REGSRC, 0xFF); }  \
		E->alu_reg(EA_ADD, REGDST, REGSRC);              \
	} while (0)

#endif /* SNESREC_EMIT_H */
