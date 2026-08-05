/*
 * decode.cc -- the 65816 decoder: one arm per opcode, emitting host assembly.
 * Split out of recomp.cc; contents unchanged.
 */
#include "snesrec.h"
#include "emit.h"

void decode_65C816(CodeAddr ca)
{
  int op = INS_OP(ca.ins);
  if (op == 0x00 || op == 0x02) { // brk #imm / cop #imm
    uint16_t p = (ca.pc & 0xFFFF) + 2;
    uint32_t retaddr = (ca.pc & 0xFF0000) | p;
    E->mov_reg_immw(VR_ARG0, (retaddr >> 16) & 0xFF, EW8);
    CALL_FUNCTION_STK("__PUSH8");
    E->mov_reg_immw(VR_ARG0, (retaddr >> 8) & 0xFF, EW8);
    CALL_FUNCTION_STK("__PUSH8");
    E->mov_reg_immw(VR_ARG0, retaddr & 0xFF, EW8);
    CALL_FUNCTION_STK("__PUSH8");
    CALL_FUNCTION_STK("__PHP");
    MOV_REG8_IMM("I_Flag", 1);
    MOV_REG8_IMM("D_Flag", 0);
    if (op == 0x00) E->jump(EC_ALWAYS, "Label_BRK");
    if (op == 0x02) E->jump(EC_ALWAYS, "Label_COP");
    ADD_CYCLES(7);
  } else
  if (op == 0xEA) { // nop
    E->nop();
    ADD_CYCLES(2);
  } else
  if (op == 0x58) { // cli
    MOV_REG8_IMM("I_Flag", 0);
    ADD_CYCLES(2);
  } else
  if (op == 0x78) { // sei
    MOV_REG8_IMM("I_Flag", 1);
    ADD_CYCLES(2);
  } else
  if (op == 0x18) { // clc
    MOV_REG8_IMM("C_Flag", 0);
    ADD_CYCLES(2);
  } else
  if (op == 0x38) { // sec
    MOV_REG8_IMM("C_Flag", 1);
    ADD_CYCLES(2);
  } else
  if (op == 0xB8) { // clv
    MOV_REG8_IMM("V_Flag", 0);
    ADD_CYCLES(2);
  } else
  if (op == 0xD8) { // cld
    MOV_REG8_IMM("D_Flag", 0);
    ADD_CYCLES(2);
  } else
  if (op == 0xF8) { // sed
    MOV_REG8_IMM("D_Flag", 1);
    ADD_CYCLES(2);
  } else
  if (op == 0x5B) { // tcd
    E->load_sym(VR_TMP, "regA", EW16);
    E->store_sym("regDP", VR_TMP, EW16);
    E->mov_reg_reg(VR_ARG0, VR_TMP);
    CALL_FUNCTION_STK("__TESTNZ16");
    ADD_CYCLES(2);
  } else
  if (op == 0x7B) { // tdc
    E->load_sym(VR_TMP, "regDP", EW16);
    E->store_sym("regA", VR_TMP, EW16);
    UPDATE_NZ_A(0);
    ADD_CYCLES(2);
  } else
  if (op == 0x08) { // php
    CALL_FUNCTION_STK("__PHP");
    ADD_CYCLES(3);
  } else
  if (op == 0x28) { // plp
    CALL_FUNCTION_STK("__PLP");
    ADD_CYCLES(4);
  } else
  if (op == 0x14) { // trb dp
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    E->mov_reg_reg(VR_SAVE, VR_ARG0);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->mov_reg_reg(VR_ARG0, VR_TMP);
      CALL_FUNCTION_STK("__TRB");
      E->mov_reg_reg(VR_ARG0, VR_SAVE);
      E->mov_reg_reg(VR_ARG1, VR_TMP);
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->mov_reg_reg(VR_ARG0, VR_TMP);
      CALL_FUNCTION_STK("__TRB");
      E->mov_reg_reg(VR_ARG0, VR_SAVE);
      E->mov_reg_reg(VR_ARG1, VR_TMP);
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(4);
  } else
  if (op == 0x1C) { // trb addr
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    E->mov_reg_reg(VR_SAVE, VR_ARG0);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->mov_reg_reg(VR_ARG0, VR_TMP);
      CALL_FUNCTION_STK("__TRB");
      E->mov_reg_reg(VR_ARG0, VR_SAVE);
      E->mov_reg_reg(VR_ARG1, VR_TMP);
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->mov_reg_reg(VR_ARG0, VR_TMP);
      CALL_FUNCTION_STK("__TRB");
      E->mov_reg_reg(VR_ARG0, VR_SAVE);
      E->mov_reg_reg(VR_ARG1, VR_TMP);
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(4);
  } else
  if (op == 0x04) { // tsb dp
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    E->mov_reg_reg(VR_SAVE, VR_ARG0);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->mov_reg_reg(VR_ARG0, VR_TMP);
      CALL_FUNCTION_STK("__TSB");
      E->mov_reg_reg(VR_ARG0, VR_SAVE);
      E->mov_reg_reg(VR_ARG1, VR_TMP);
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->mov_reg_reg(VR_ARG0, VR_TMP);
      CALL_FUNCTION_STK("__TSB");
      E->mov_reg_reg(VR_ARG0, VR_SAVE);
      E->mov_reg_reg(VR_ARG1, VR_TMP);
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(4);
  } else
  if (op == 0x0C) { // tsb addr
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    E->mov_reg_reg(VR_SAVE, VR_ARG0);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->mov_reg_reg(VR_ARG0, VR_TMP);
      CALL_FUNCTION_STK("__TSB");
      E->mov_reg_reg(VR_ARG0, VR_SAVE);
      E->mov_reg_reg(VR_ARG1, VR_TMP);
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->mov_reg_reg(VR_ARG0, VR_TMP);
      CALL_FUNCTION_STK("__TSB");
      E->mov_reg_reg(VR_ARG0, VR_SAVE);
      E->mov_reg_reg(VR_ARG1, VR_TMP);
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(4);
  } else
  if (op == 0x0B) { // phd
    E->load_sym(VR_ARG0, "regDP", EW16);
    CALL_FUNCTION_STK("__PUSH16");
    ADD_CYCLES(3);
  } else
  if (op == 0x2B) { // pld
    CALL_FUNCTION_STK("__PULL16");
    E->store_sym("regDP", VR_TMP, EW16);
    E->mov_reg_reg(VR_ARG0, VR_TMP);
    CALL_FUNCTION_STK("__TESTNZ16");
    ADD_CYCLES(3);
  } else
  if (op == 0xD4) { // pei dp
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->mov_reg_reg(VR_ARG0, VR_TMP);
    CALL_FUNCTION_STK("__PUSH16");
    ADD_CYCLES(cycles);
  } else
  if (op == 0xF4) { // pea addr
    uint16_t address = INS_GETA10(ca.ins);
    E->mov_reg_immw(VR_ARG0, address, EW16);
    CALL_FUNCTION_STK("__PUSH16");
    ADD_CYCLES(5);
  } else
  if (op == 0x62) { // per rel
    int16_t rel = INS_GETA10(ca.ins);
    uint16_t p = ca.pc & 0xFFFF;
    p += rel + 3;
    E->mov_reg_immw(VR_ARG0, ca.pc | p, EW16);
    CALL_FUNCTION_STK("__PUSH16");
    ADD_CYCLES(5);
  } else
  if (op == 0x48) { // pha
    int cycles = 3;
    E->load_sym(VR_ARG0, "regA", EW16);
    if (ca.M) {
      CALL_FUNCTION_STK("__PUSH8");
    } else {
      CALL_FUNCTION_STK("__PUSH16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xDA) { // phx
    int cycles = 3;
    E->load_sym(VR_ARG0, "regX", EW16);
    if (ca.X) {
      CALL_FUNCTION_STK("__PUSH8");
    } else {
      CALL_FUNCTION_STK("__PUSH16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x5A) { // phy
    int cycles = 3;
    E->load_sym(VR_ARG0, "regY", EW16);
    if (ca.X) {
      CALL_FUNCTION_STK("__PUSH8");
    } else {
      CALL_FUNCTION_STK("__PUSH16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x68) { // pla
    int cycles = 4;
    if (ca.M) {
      CALL_FUNCTION_STK("__PULL8");
      E->store_sym("regA", VR_TMP, EW8);
    } else {
      CALL_FUNCTION_STK("__PULL16");
      E->store_sym("regA", VR_TMP, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xFA) { // plx
    int cycles = 4;
    if (ca.X) {
      CALL_FUNCTION_STK("__PULL8");
      E->store_sym("regX", VR_TMP, EW8);
    } else {
      CALL_FUNCTION_STK("__PULL16");
      E->store_sym("regX", VR_TMP, EW16);
      cycles++;
    }
    UPDATE_NZ_X(ca.X);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x7A) { // ply
    int cycles = 4;
    if (ca.X) {
      CALL_FUNCTION_STK("__PULL8");
      E->store_sym("regY", VR_TMP, EW8);
    } else {
      CALL_FUNCTION_STK("__PULL16");
      E->store_sym("regY", VR_TMP, EW16);
      cycles++;
    }
    UPDATE_NZ_Y(ca.X);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x4B) { // phk
    E->mov_reg_immw(VR_ARG0, ca.K, EW8);
    CALL_FUNCTION_STK("__PUSH8");
    ADD_CYCLES(3);
  } else
  if (op == 0x8B) { // phb
    E->load_sym(VR_ARG0, "regDBR", EW8);
    CALL_FUNCTION_STK("__PUSH8");
    ADD_CYCLES(3);
  } else
  if (op == 0xAB) { // plb
    CALL_FUNCTION_STK("__PULL8");
    E->store_sym("regDBR", VR_TMP, EW8);
    E->mov_reg_reg(VR_ARG0, VR_TMP);
    CALL_FUNCTION_STK("__TESTNZ8");
    ADD_CYCLES(4);
  } else
  if (op == 0xCB) { // wai
    CALL_FUNCTION("__WAI");
  } else
  if (op == 0x9A) { // txs
    E->load_sym(VR_TMP, "regX", EW16);
    E->store_sym("regS", VR_TMP, EW16);
    ADD_CYCLES(2);
  } else
  if (op == 0xBA) { // tsx
    E->load_sym(VR_TMP, "regS", EW16);
    if (ca.X) { E->alu_imm(EA_AND, VR_TMP, 0xFF); }
    E->store_sym("regX", VR_TMP, EW16);
    UPDATE_NZ_X(ca.X);
    ADD_CYCLES(2);
  } else
  if (op == 0x3B) { // tsc
    E->load_sym(VR_TMP, "regS", EW16);
    E->store_sym("regA", VR_TMP, EW16);
    UPDATE_NZ_A(0);
    ADD_CYCLES(2);
  } else
  if (op == 0x1B) { // tcs
    E->load_sym(VR_TMP, "regA", EW16);
    E->store_sym("regS", VR_TMP, EW16);
    ADD_CYCLES(2);
  } else
  if (op == 0xAA) { // tax
    if (ca.X) {
      E->load_sym(VR_TMP, "regA", EW8);
      E->store_sym("regX", VR_TMP, EW8);
    } else {
      E->load_sym(VR_TMP, "regA", EW16);
      E->store_sym("regX", VR_TMP, EW16);
    }
    UPDATE_NZ_X(ca.X);
    ADD_CYCLES(2);
  } else
  if (op == 0x8A) { // txa
    if (ca.M) {
      E->load_sym(VR_TMP, "regX", EW8);
      E->store_sym("regA", VR_TMP, EW8);
    } else {
      E->load_sym(VR_TMP, "regX", EW16);
      E->store_sym("regA", VR_TMP, EW16);
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(2);
  } else
  if (op == 0xA8) { // tay
    if (ca.X) {
      E->load_sym(VR_TMP, "regA", EW8);
      E->store_sym("regY", VR_TMP, EW8);
    } else {
      E->load_sym(VR_TMP, "regA", EW16);
      E->store_sym("regY", VR_TMP, EW16);
    }
    UPDATE_NZ_Y(ca.X);
    ADD_CYCLES(2);
  } else
  if (op == 0x98) { // tya
    if (ca.M) {
      E->load_sym(VR_TMP, "regY", EW8);
      E->store_sym("regA", VR_TMP, EW8);
    } else {
      E->load_sym(VR_TMP, "regY", EW16);
      E->store_sym("regA", VR_TMP, EW16);
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(2);
  } else
  if (op == 0x9B) { // txy
    if (ca.X) {
      E->load_sym(VR_TMP, "regX", EW8);
      E->store_sym("regY", VR_TMP, EW8);
    } else {
      E->load_sym(VR_TMP, "regX", EW16);
      E->store_sym("regY", VR_TMP, EW16);
    }
    UPDATE_NZ_Y(ca.X);
    ADD_CYCLES(2);
  } else
  if (op == 0xBB) { // tyx
    if (ca.X) {
      E->load_sym(VR_TMP, "regY", EW8);
      E->store_sym("regX", VR_TMP, EW8);
    } else {
      E->load_sym(VR_TMP, "regY", EW16);
      E->store_sym("regX", VR_TMP, EW16);
    }
    UPDATE_NZ_X(ca.X);
    ADD_CYCLES(2);
  } else
  if (op == 0x40) { // rti
    E->store_sym_imm("inNMI", 0, EW8);
    ADD_CYCLES(6);
    CALL_FUNCTION_STK("__PLP");
    CALL_FUNCTION_STK("__PULL8");
    E->mov_reg_reg(VR_PC, VR_TMP);
    CALL_FUNCTION_STK("__PULL8");
    E->alu_imm(EA_SHL, VR_TMP, 8);
    E->alu_reg(EA_OR, VR_PC, VR_TMP);
    CALL_FUNCTION_STK("__PULL8");
    E->mov_reg_reg(VR_ARG0, VR_TMP);
    E->alu_imm(EA_SHL, VR_ARG0, 16);
    E->alu_reg(EA_OR, VR_ARG0, VR_PC);
    E->mov_reg_immw(VR_PC, ca.pc, EW32);
    E->jump(EC_ALWAYS, "__CALL_ADDRESS");
  } else
  if (op == 0x54) { // mvn src, dest
    uint8_t dest = INS_GETA0(ca.ins);
    uint8_t src = INS_GETA1(ca.ins);
    LOAD_IMM(VR_ARG0, src);
    LOAD_IMM(VR_ARG1, dest);
    CALL_FUNCTION_STK("__MVN");
  } else
  if (op == 0x44) { // mvp src, dest
    uint8_t dest = INS_GETA0(ca.ins);
    uint8_t src = INS_GETA1(ca.ins);
    LOAD_IMM(VR_ARG0, src);
    LOAD_IMM(VR_ARG1, dest);
    CALL_FUNCTION_STK("__MVP");
  } else
  if (op == 0x49) { // eor #imm
    int cycles = 2;
    if (ca.M) {
      uint8_t v = INS_GETA0(ca.ins);
      E->load_sym(VR_TMP, "regA", EW8);
      E->alu_imm(EA_XOR, VR_TMP, v);
      E->store_sym("regA", VR_TMP, EW8);
    } else {
      uint16_t v = INS_GETA10(ca.ins);
      E->load_sym(VR_TMP, "regA", EW16);
      E->alu_imm(EA_XOR, VR_TMP, v);
      E->store_sym("regA", VR_TMP, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x4D) { // eor addr
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x5D) { // eor addr, x
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x59) { // eor addr, y
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x4F) { // eor long
    int cycles = 5;
    uint32_t address = INS_GETA210(ca.ins);
    E->mov_reg_imm(VR_ARG0, address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x5F) { // eor long, x
    int cycles = 5;
    uint32_t address = INS_GETA210(ca.ins);
    E->mov_reg_imm(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x45) { // eor dp
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x55) { // eor dp, x
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x52) { // eor (dp)
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->load_sym(VR_ARG0, "regDBR", EW8);
    E->alu_imm(EA_SHL, VR_ARG0, 16);
    E->alu_reg(EA_ADD, VR_ARG0, VR_TMP);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x51) { // eor (dp), y
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->load_sym(VR_ARG0, "regDBR", EW8);
    E->alu_imm(EA_SHL, VR_ARG0, 16);
    E->alu_reg(EA_ADD, VR_ARG0, VR_TMP);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x41) { // eor (dp, x)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->alu_imm(EA_AND, VR_ARG0, 0xFFFF);
    CALL_FUNCTION_STK("__READ16");
    E->load_sym(VR_ARG0, "regDBR", EW8);
    E->alu_imm(EA_SHL, VR_ARG0, 16);
    E->alu_reg(EA_ADD, VR_ARG0, VR_TMP);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x47) { // eor [dp]
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ24");
    E->mov_reg_reg(VR_ARG0, VR_TMP);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x57) { // eor [dp], y
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ24");
    E->mov_reg_reg(VR_ARG0, VR_TMP);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x43) { // eor sr, s
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x53) { // eor (sr, s), y
    int cycles = 7;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->load_sym(VR_ARG0, "regDBR", EW8);
    E->alu_imm(EA_SHL, VR_ARG0, 16);
    E->alu_reg(EA_ADD, VR_ARG0, VR_TMP);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->load_sym(VR_SAVE, "regA", EW8);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW8);
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->load_sym(VR_SAVE, "regA", EW16);
      E->alu_reg(EA_XOR, VR_SAVE, VR_TMP);
      E->store_sym("regA", VR_SAVE, EW16);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x4A) { // lsr a
    if (ca.M) {
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__LSR8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__LSR16");
      E->raw("  mov word [rel regA], ax\n");
    }
    ADD_CYCLES(2);
  } else
  if (op == 0x4E) { // lsr addr
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__LSR8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__LSR16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(5);
  } else
  if (op == 0x5E) { // lsr addr, x
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__LSR8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__LSR16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(6);
  } else
  if (op == 0x46) { // lsr dp
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__LSR8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__LSR16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(4);
  } else
  if (op == 0x56) { // lsr dp, x
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__LSR8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__LSR16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(5);
  } else
  if (op == 0x0A) { // asl a
    if (ca.M) {
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ASL8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ASL16");
      E->raw("  mov word [rel regA], ax\n");
    }
    ADD_CYCLES(2);
  } else
  if (op == 0x0E) { // asl addr
    int cycles = 6;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    if (ca.M) {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ASL8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ASL16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles += 2;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x1E) { // asl addr, X
    int cycles = 7;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ASL8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ASL16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles += 2;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x06) { // asl dp
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.M) {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ASL8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ASL16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles += 2;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x16) { // asl dp, X
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ASL8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ASL16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles += 2;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x2A) { // rol a
    if (ca.M) {
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ROL8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ROL16");
      E->raw("  mov word [rel regA], ax\n");
    }
    ADD_CYCLES(2);
  } else
  if (op == 0x2E) { // rol addr
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROL8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROL16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x3E) { // rol addr, x
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROL8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROL16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x26) { // rol dp
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROL8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROL16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x36) { // rol dp, x
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    // E->raw("  and rcx, 0xFFFF\n");
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROL8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROL16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x6A) { // ror a
    if (ca.M) {
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ROR8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ROR16");
      E->raw("  mov word [rel regA], ax\n");
    }
    ADD_CYCLES(2);
  } else
  if (op == 0x6E) { // ror addr
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROR8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROR16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x7E) { // ror addr, x
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROR8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROR16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x66) { // ror dp
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROR8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROR16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x76) { // ror dp, x
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    // E->raw("  and rcx, 0xFFFF\n");
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROR8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__ROR16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x89) { // bit #imm
    int cycles = 2;
    if (ca.M) {
      uint8_t v = INS_GETA0(ca.ins);
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, 0x%02X\n", v);
    } else {
      uint16_t v = INS_GETA10(ca.ins);
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, 0x%04X\n", v);
      cycles++;
    }
    E->raw("  and rcx, rdx\n");
    E->raw("  cmp rcx, 0\n");
    E->raw("  sete byte [rel Z_Flag]\n");
    ADD_CYCLES(cycles);
  } else
  if (op == 0x2C) { // bit addr
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, 0x%04X\n", address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      cycles++;
    }
    E->raw("  movzx rcx, ax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__BIT8");
    } else {
      CALL_FUNCTION_STK("__BIT16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x3C) { // bit addr, x
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, 0x%04X\n", address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__BIT8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__BIT16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x24) { // bit dp
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, ax\n");
      CALL_FUNCTION_STK("__BIT8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, ax\n");
      CALL_FUNCTION_STK("__BIT16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x34) { // bit dp, x
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, ax\n");
      CALL_FUNCTION_STK("__BIT8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, ax\n");
      CALL_FUNCTION_STK("__BIT16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x69) { // adc #imm
    int cycles = 2;
    E->raw("  movzx rcx, word [rel regA]\n");
    if (ca.M) {      
      uint8_t v = INS_GETA0(ca.ins);
      LOAD_IMM(VR_ARG1, v);
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      uint16_t v = INS_GETA10(ca.ins);
      LOAD_IMM(VR_ARG1, v);
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x6D) { // adc addr
    int cycles = 3;
    uint16_t address = INS_GETA10(ca.ins);
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, 0x%04X\n", address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x79) { // adc addr, y
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, 0x%04X\n", address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x7D) { // adc addr, x
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, 0x%04X\n", address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x65) { // adc dp
    int cycles = 3;
    uint8_t offset = INS_GETA10(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x75) { // adc dp, x
    int cycles = 4;
    uint8_t offset = INS_GETA10(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    // E->raw("  and rcx, 0xFFFF\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x61) { // adc (dp, x)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x72) { // adc (dp)
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x71) { // adc (dp), y
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    E->raw("  movzx rax, word [rel regY]\n");
    if (ca.X) {
      E->raw("  and rax, 0xFF\n");
      cycles++;
    }
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x67) { // adc [dp]
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x77) { // adc [dp], y
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    E->raw("  movzx rax, word [rel regY]\n");
    if (ca.X) {
      E->raw("  and rax, 0xFF\n");
    }
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x6F) { // adc long
    int cycles = 4;
    uint32_t address = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x7F) { // adc long, x
    int cycles = 5;
    uint32_t address = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x63) { // adc sr, s
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x73) { // adc (sr, s), y
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    E->raw("  movzx rax, word [rel regY]\n");
    if (ca.X) {
      E->raw("  and rax, 0xFF\n");
      cycles++;
    }
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__ADC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      printf(" mov rcx, rax\n");
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__ADC16");
      E->raw("  mov word [rel regA], ax\n");
    }
  } else
  if (op == 0xE9) { // sbc #imm
    int cycles = 2;
    E->raw("  movzx rcx, word [rel regA]\n");
    if (ca.M) {
      uint8_t v = INS_GETA0(ca.ins);
      E->raw("  mov rdx, 0x%02X\n", v);
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      uint16_t v = INS_GETA10(ca.ins);
      E->raw("  mov rdx, 0x%04X\n", v);
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xE5) { // sbc dp
    int cycles = 5;
    uint8_t offset = INS_GETA10(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xF5) { // sbc dp, x
    int cycles = 5;
    uint8_t offset = INS_GETA10(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xF2) { // sbc (dp)
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xF1) { // sbc (dp), y
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xE1) { // sbc (dp, x)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xED) { // sbc addr
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xFD) { // sbc addr, x
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xF9) { // sbc addr, y
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xEF) { // sbc long
    int cycles = 5;
    uint32_t longaddr = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", longaddr);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xFF) { // sbc long, x
    int cycles = 5;
    uint32_t longaddr = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", longaddr);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xE7) { // sbc [dp]
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xF7) { // sbc [dp], y
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xE3) { // sbc sr, s
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xF3) { // sbc (sr, s), y
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__SBC16");
      E->raw("  mov word [rel regA], ax\n");
    }
  } else
  if (op == 0x29) { // and #imm
    int cycles = 2;
    if (ca.M) {
      uint8_t v = INS_GETA0(ca.ins);
      E->raw("  mov al, byte [rel regA]\n");
      E->raw("  and al, 0x%02X\n", v);
      E->raw("  mov byte [rel regA], al\n");
    } else {
      cycles++;
      uint16_t v = INS_GETA10(ca.ins);
      E->raw("  mov ax, word [rel regA]\n");
      E->raw("  and ax, 0x%04X\n", v);
      E->raw("  mov word [rel regA], ax\n");
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x2D) { // and addr
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, 0x%04X\n", address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x3D) { // and addr, x
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x39) { // and addr, y
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x2F) { // and long
    int cycles = 5;
    uint32_t longaddr = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", longaddr);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x3F) { // and long, x
    int cycles = 5;
    uint32_t longaddr = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", longaddr);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x25) { // and dp
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x35) { // and dp, x
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    E->raw("  movzx rax, word [rel regX]\n");
    if (ca.X) {
      E->raw("  and rax, 0xFF\n");
    }
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x32) { // and (dp)
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x31) { // and (dp), y
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x21) { // and (dp, x)
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    E->raw("  movzx rax, word [rel regX]\n");
    if (ca.X) {
      E->raw("  and rax, 0xFF\n");
    }
    E->raw("  add rcx, rax\n");
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x27) { // and [dp] (long)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x37) { // and [dp], y (long)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x23) { // and sr, s
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x33) { // and (sr, s), y
    int cycles = 7;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, word [rel regY]\n");
    if (ca.X) {
      E->raw("  and rcx, 0xFF\n");
    }
    E->raw("  add rcx, rax\n");
    E->raw("  movzx rax, byte [rel regDBR]\n");
    E->raw("  shl rax, 16\n");
    E->raw("  or rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  and byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  and word [rel regA], ax\n");
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x09) { // ora #imm
    int cycles = 2;
    E->raw("  mov ax, word [rel regA]\n");
    if (ca.M) {
      uint8_t v = INS_GETA0(ca.ins);
      E->raw("  or al, 0x%02X\n", v);
      E->raw("  mov byte [rel regA], al\n");
    } else {
      uint16_t v = INS_GETA10(ca.ins);
      E->raw("  or ax, 0x%04X\n", v);
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x0D) { // ora addr
    int cycles = 3;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x1D) { // ora addr, x
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x19) { // ora addr, y
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x0F) { // ora long
    int cycles = 5;
    uint32_t address = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x1F) { // ora long, x
    int cycles = 5;
    uint32_t address = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x05) { // ora dp
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x15) { // ora dp, x
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x12) { // ora (dp)
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, word [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x11) { // ora (dp), y
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, word [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x01) { // ora (dp, x)
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, word [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x07) { // ora [dp] (long)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x17) { // ora [dp], y (long)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x03) { // ora sr, s
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x13) { // ora (sr, s), y
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, word [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  or cl, al\n");
      E->raw("  mov byte [rel regA], cl\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  or cx, ax\n");
      E->raw("  mov word [rel regA], cx\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x1A) { // inc
    if (ca.M) {
      E->raw("  mov al, byte [rel regA]\n");
      E->raw("  inc al\n");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      E->raw("  mov ax, word [rel regA]\n");
      E->raw("  inc ax\n");
      E->raw("  mov word [rel regA], ax\n");
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(2);
  } else
  if (op == 0xEE) { // inc addr
    int cycles = 6;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__INC8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__INC16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xFE) { // inc addr, x
    int cycles = 7;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__INC8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__INC16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xE6) { // inc dp
    int cycles = 2;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__INC8");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__INC16");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xF6) { // INC DirectPage, X
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    if (ca.X) {
      E->raw("  movzx rax, byte [rel regX]\n");
    } else {
      E->raw("  movzx rax, word [rel regX]\n");
    }
    E->raw("  add rcx, rax\n");
    E->raw("  mov r12, rcx\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__INC8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rcx, rax\n");
      CALL_FUNCTION_STK("__INC16");
      cycles++;
    }
    E->raw("  mov rcx, r12\n");
    E->raw("  mov rdx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x3A) { // dec
    if (ca.M) {
      E->raw("  mov al, byte [rel regA]\n");
      E->raw("  dec al\n");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      E->raw("  mov ax, word [rel regA]\n");
      E->raw("  dec ax\n");
      E->raw("  mov word [rel regA], ax\n");
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(2);
  } else
  if (op == 0xCE) { // dec addr
    int cycles = 6; // NA
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    if (ca.M) {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ8");
      E->raw("  dec al\n");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      E->raw("  mov rbx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
      E->raw("  mov rcx, rbx\n");
      CALL_FUNCTION_STK("__TESTNZ8");
    } else {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ16");
      E->raw("  dec ax\n");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      E->raw("  mov rbx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
      E->raw("  mov rcx, rbx\n");
      CALL_FUNCTION_STK("__TESTNZ16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xDE) { // dec addr, x
    int cycles = 6; // NA
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ8");
      E->raw("  dec al\n");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      E->raw("  mov rbx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
      E->raw("  mov rcx, rbx\n");
      CALL_FUNCTION_STK("__TESTNZ8");
    } else {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ16");
      E->raw("  dec ax\n");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      E->raw("  mov rbx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
      E->raw("  mov rcx, rbx\n");
      CALL_FUNCTION_STK("__TESTNZ16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xC6) { // dec dp
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.M) {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ8");
      E->raw("  dec al\n");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      E->raw("  mov rbx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
      E->raw("  mov rcx, rbx\n");
      CALL_FUNCTION_STK("__TESTNZ8");
    } else {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ16");
      E->raw("  dec ax\n");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      E->raw("  mov rbx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
      E->raw("  mov rcx, rbx\n");
      CALL_FUNCTION_STK("__TESTNZ16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xD6) { // dec dp, x
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ8");
      E->raw("  dec al\n");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      E->raw("  mov rbx, rax\n");
      CALL_FUNCTION_STK("__WRITE8");
      E->raw("  mov rcx, rbx\n");
      CALL_FUNCTION_STK("__TESTNZ8");
    } else {
      E->raw("  mov r12, rcx\n");
      CALL_FUNCTION_STK("__READ16");
      E->raw("  dec ax\n");
      E->raw("  mov rcx, r12\n");
      E->raw("  mov rdx, rax\n");
      E->raw("  mov rbx, rax\n");
      CALL_FUNCTION_STK("__WRITE16");
      E->raw("  mov rcx, rbx\n");
      CALL_FUNCTION_STK("__TESTNZ16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xE8) { // inx
    if (ca.X) {
      E->raw("  movzx rcx, byte [rel regX]\n");
      CALL_FUNCTION_STK("__INC8");
      E->raw("  mov byte [rel regX], al\n");
    } else {
      E->raw("  movzx rcx, word [rel regX]\n");
      CALL_FUNCTION_STK("__INC16");
      E->raw("  mov word [rel regX], ax\n");
    }
    ADD_CYCLES(2);
  } else
  if (op == 0xCA) { // DEX
    E->raw("  mov ax, word [rel regX]\n");
    E->raw("  dec ax\n");
    E->raw("  mov word [rel regX], ax\n");
    UPDATE_NZ_X(ca.X);
    ADD_CYCLES(2);
  } else
  if (op == 0xC8) { // INY
    if (ca.X) {
      E->raw("  movzx rcx, byte [rel regY]\n");
      CALL_FUNCTION_STK("__INC8");
      E->raw("  mov byte [rel regY], al\n");
    } else {
      E->raw("  movzx rcx, word [rel regY]\n");
      CALL_FUNCTION_STK("__INC16");
      E->raw("  mov word [rel regY], ax\n");
    }
    ADD_CYCLES(2);
  } else
  if (op == 0x88) { // dey
    E->raw("  mov ax, word [rel regY]\n");
    E->raw("  dec ax\n");
    E->raw("  mov word [rel regY], ax\n");
    UPDATE_NZ_Y(ca.X);
    ADD_CYCLES(2);
  } else
  if (op == 0x60) { // rts
    ADD_CYCLES(6);
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  mov bl, al\n");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  mov bh, al\n");
    E->raw("  inc bx\n");
    E->raw("  and rbx, 0xFFFF\n");
    E->raw("  mov rcx, 0x%06X\n", ca.pc & 0xFF0000);
    E->raw("  or rcx, rbx\n");
    E->raw("  mov rbx, 0x%06X\n", ca.pc);
    E->raw("  jmp __CALL_ADDRESS\n");
  } else
  if (op == 0x6B) { // rtl
    ADD_CYCLES(6);
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  mov bl, al\n");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  mov bh, al\n");
    E->raw("  inc bx\n");
    E->raw("  and rbx, 0xFFFF\n");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  movzx rcx, al\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  or rcx, rbx\n");
    E->raw("  mov rbx, 0x%06X\n", ca.pc);
    E->raw("  jmp __CALL_ADDRESS\n");
  } else
  if (op == 0xEB) { // xba
    E->raw("  mov ax, word [rel regA]\n");
    E->raw("  mov bl, al\n");
    E->raw("  mov al, ah\n");
    E->raw("  mov ah, bl\n");
    E->raw("  mov word [rel regA], ax\n");
    UPDATE_NZ_A(1);
    ADD_CYCLES(3);
  } else
  if (op == 0xFB) { // xce
    CALL_FUNCTION_STK("__XCE");
    ADD_CYCLES(2);
  } else
  if (op == 0x42) { // wdm
    uint8_t v = INS_GETA0(ca.ins);
    CALL_FUNCTION("__WDM");
  } else
  if (op == 0xC2) { // rep
    uint8_t mask = INS_GETA0(ca.ins);
    LOAD_IMM(VR_ARG0, mask);
    CALL_FUNCTION_STK("__REP");
    ADD_CYCLES(3);
  } else
  if (op == 0xE2) { // SEP
    uint8_t mask = INS_GETA0(ca.ins);
    LOAD_IMM(VR_ARG0, mask);
    CALL_FUNCTION_STK("__SEP");
    ADD_CYCLES(3);
  } else
  if (op == 0xC9) { // cmp #imm
    int cycles = 2;
    E->raw("  movzx rcx, word [rel regA]\n");
    if (ca.M) {
      uint8_t v = INS_GETA0(ca.ins);
      LOAD_IMM(VR_ARG1, v);
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      uint16_t v = INS_GETA10(ca.ins);
      LOAD_IMM(VR_ARG1, v);
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xCD) { // cmp addr
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xDD) { // cmp addr, x
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xD9) { // cmp addr, y
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov rdx, rax\n");
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xDD) { // cmp addr, x
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, 0x%04X\n", address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      cycles++;
    }
    E->raw("  mov rdx, rax\n");
    if (ca.M) {
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xCF) { // cmp long
    int cycles = 6;
    uint32_t address = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      cycles++;
    }
    E->raw("  mov rdx, rax\n");
    if (ca.M) {
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xDF) { // cmp long, x
    int cycles = 4;
    uint32_t address = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      cycles++;
    }
    E->raw("  mov rdx, rax\n");
    if (ca.M) {
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xC5) { // cmp dp
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rdx, al\n");
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rdx, ax\n");
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xD5) { // cmp dp, x
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rdx, al\n");
      E->raw("  movzx rcx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rdx, ax\n");
      E->raw("  movzx rcx, word [rel regA]\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xD2) { // cmp (dp)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, word [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xD1) { // cmp (dp), y
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, word [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xC1) { // cmp (dp, x)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, word [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xC7) { // cmp [dp] (long)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xD7) { // cmp [dp], Y (Long)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    E->raw("  movzx rcx, word [rel regDP]\n");
    E->raw("  add rcx, 0x%02X\n", offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  movzx ebx, word [rel regY]\n");
    E->raw("  add eax, ebx\n");
    E->raw("  mov rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xC3) { // cmp sr, s
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
     if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xD3) { // cmp (sr, s), y
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, word [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
     if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rcx, byte [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rcx, word [rel regA]\n");
      E->raw("  mov rdx, rax\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xE0) { // cpx #imm
    int cycles = 2;
    E->raw("  mov ax, word [rel regX]\n", 0);
    E->raw("  movzx rcx, ax\n");
    if (ca.X) {
      uint8_t v = INS_GETA0(ca.ins);
      E->raw("  mov rdx, 0x%02X\n", v);
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      cycles++;
      uint16_t v = INS_GETA10(ca.ins);
      E->raw("  mov rdx, 0x%04X\n", v);
      CALL_FUNCTION_STK("__COMPARE16");
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xEC) { // cpx addr
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rdx, al\n");
      E->raw("  movzx rcx, byte [rel regX]\n", 0);
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rdx, ax\n", 0);
      E->raw("  movzx rcx, word [rel regX]\n", 0);
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xE4) { // cpx dp
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rdx, al\n");
      E->raw("  movzx rcx, byte [rel regX]\n", 0);
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rdx, ax\n", 0);
      E->raw("  movzx rcx, word [rel regX]\n", 0);
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xC0) { // cpy #imm
    int cycles = 2;
    E->raw("  movzx rcx, word [rel regY]\n");
    if (ca.X) {
      uint8_t v = INS_GETA0(ca.ins);
      LOAD_IMM(VR_ARG1, v);
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      uint16_t v = INS_GETA10(ca.ins);
      LOAD_IMM(VR_ARG1, v);
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xCC) { // cpy addr
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rdx, al\n");
      E->raw("  movzx rcx, byte [rel regY]\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rdx, ax\n");
      E->raw("  movzx rcx, word [rel regY]\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0xC4) { // cpy dp
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  movzx rdx, al\n");
      E->raw("  movzx rcx, byte [rel regY]\n");
      CALL_FUNCTION_STK("__COMPARE8");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  movzx rdx, ax\n");
      E->raw("  movzx rcx, word [rel regY]\n");
      CALL_FUNCTION_STK("__COMPARE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x80) { // bra rel
    int8_t rel = INS_GETA0(ca.ins);
    uint16_t p = ca.pc & 0xFFFF;
    p += rel + 2;
    uint32_t absolute = ca.pc & 0xFF0000 | p;
    ADD_CYCLES(3);
    if (is_routines(absolute)) {
      E->raw("  jmp Label_%06X\n", absolute);
    } else {
      E->raw("  ; Never branches to %06X\n", absolute);
    }
  } else
  if (op == 0x82) { // brl rel (long)
    int16_t rel = INS_GETA10(ca.ins);
    uint16_t p = ca.pc & 0xFFFF;
    p += rel + 3;
    uint32_t absolute = ca.pc & 0xFF0000 | p;
    ADD_CYCLES(4);
    if (is_routines(absolute)) {
      E->raw("  jmp Label_%06X\n", absolute);
    } else {
      E->raw("  ; Never branches to %06X\n", absolute);
    }
  } else
  if (op == 0xD0) { // BNE Rel
    int8_t rel = INS_GETA0(ca.ins);
    uint16_t p = ca.pc & 0xFFFF;
    p += rel + 2;
    uint32_t absolute = ca.pc & 0xFF0000 | p;
    ADD_CYCLES(2);
    if (is_routines(absolute)) {
      E->raw("  cmp byte [rel Z_Flag], 0\n");
      E->raw("  je Label_%06X\n", absolute);
    } else {
      E->raw("  ; Never branches to %06X\n", absolute);
    }
  } else
  if (op == 0xF0) { // BEQ Rel
    int8_t rel = INS_GETA0(ca.ins);
    uint16_t p = ca.pc & 0xFFFF;
    p += rel + 2;
    uint32_t absolute = ca.pc & 0xFF0000 | p;
    ADD_CYCLES(2);
    if (is_routines(absolute)) {
      E->raw("  cmp byte [rel Z_Flag], 1\n");
      E->raw("  je Label_%06X\n", absolute);
    } else {
      E->raw("  ; Never branches to %06X\n", absolute);
    }
  } else
  if (op == 0x90) { // BCC Rel
    int8_t rel = INS_GETA0(ca.ins);
    uint16_t p = ca.pc & 0xFFFF;
    p += rel + 2;
    uint32_t absolute = ca.pc & 0xFF0000 | p;
    ADD_CYCLES(2);
    if (is_routines(absolute)) {
      E->raw("  cmp byte [rel C_Flag], 0\n");
      E->raw("  je Label_%06X\n", absolute);
    } else {
      E->raw("  ; Never branches to %06X\n", absolute);
    }
  } else
  if (op == 0xB0) { // BCS Rel
    int8_t rel = INS_GETA0(ca.ins);
    uint16_t p = ca.pc & 0xFFFF;
    p += rel + 2;
    uint32_t absolute = ca.pc & 0xFF0000 | p;
    ADD_CYCLES(2);
    if (is_routines(absolute)) {
      E->raw("  cmp byte [rel C_Flag], 1\n");
      E->raw("  je Label_%06X\n", absolute);
    } else {
      E->raw("  ; Never branches to %06X\n", absolute);
    }
  } else
  if (op == 0x30) { // BMI Rel
    int8_t rel = INS_GETA0(ca.ins);
    uint16_t p = ca.pc & 0xFFFF;
    p += rel + 2;
    uint32_t absolute = ca.pc & 0xFF0000 | p;
    ADD_CYCLES(2);
    if (is_routines(absolute)) {
      E->raw("  cmp byte [rel N_Flag], 1\n");
      E->raw("  je Label_%06X\n", absolute);
    } else {
      E->raw("  ; Never branches to %06X\n", absolute);
    }
  } else
  if (op == 0x10) { // BPL Rel
    int8_t rel = INS_GETA0(ca.ins);
    uint16_t p = ca.pc & 0xFFFF;
    p += rel + 2;
    uint32_t absolute = ca.pc & 0xFF0000 | p;
    ADD_CYCLES(2);
    if (is_routines(absolute)) {
      E->raw("  cmp byte [rel N_Flag], 0\n");
      E->raw("  je Label_%06X\n", absolute);
    } else {
      E->raw("  ; Never branches to %06X\n", absolute);
    }
  } else
  if (op == 0x50) { // BVC Rel
    int8_t rel = INS_GETA0(ca.ins);
    uint16_t p = ca.pc & 0xFFFF;
    p += rel + 2;
    uint32_t absolute = ca.pc & 0xFF0000 | p;
    ADD_CYCLES(2);
    if (is_routines(absolute)) {
      E->raw("  cmp byte [rel V_Flag], 0\n");
      E->raw("  je Label_%06X\n", absolute);
    } else {
      E->raw("  ; Never branches to %06X\n", absolute);
    }
  } else
  if (op == 0x70) { // BVS Rel
    int8_t rel = INS_GETA0(ca.ins);
    uint16_t p = ca.pc & 0xFFFF;
    p += rel + 2;
    uint32_t absolute = ca.pc & 0xFF0000 | p;
    ADD_CYCLES(2);
    if (is_routines(absolute)) {
      E->raw("  cmp byte [rel V_Flag], 1\n");
      E->raw("  je Label_%06X\n", absolute);
    } else {
      E->raw("  ; Never branches to %06X\n", absolute);
    }
  } else
  if (op == 0xA9) { // lda #imm
    int cycles = 2;
    if (ca.M) {
      uint8_t v = INS_GETA0(ca.ins);
      MOV_REG8_IMM("regA", v);
    } else {
      uint16_t v = INS_GETA10(ca.ins);
      MOV_REG16_IMM("regA", v);
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xAD) { // lda addr
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xB9) { // lda addr, y
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xAF) { // lda long
    int cycles = 5;
    uint32_t address = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", address);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xA5) { // lda dp
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xB5) { // lda dp, X
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8\n");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16\n");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xB2) { // lda (dp)
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xB1) { // lda (dp), y
    int cycles = 5;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  mov rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    E->raw("  movzx rax, byte [rel regDBR]\n");
    E->raw("  shl rax, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xA1) { // lda (dp, x)
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xA7) { // lda [dp] (long)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xB7) { // lda [dp], y (long)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xBD) { // lda addr, x
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xB9) { // lda addr, y
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    E->raw("  movzx rdx, word [rel regA]\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xBF) { // lda long, X
    int cycles = 5;
    uint32_t address = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xA3) { // lda sr, s
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xB3) { // lda (sr, s), y
    int cycles = 7;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  mov rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    E->raw("  movzx rax, byte [rel regDBR]\n");
    E->raw("  shl rax, 16\n");
    E->raw("  add rcx, rax\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regA], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regA], ax\n");
      cycles++;
    }
    UPDATE_NZ_A(ca.M);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xA2) { // ldx #imm
    int cycles = 2;
    if (ca.X) {
      uint8_t v = INS_GETA0(ca.ins);
      MOV_REG8_IMM("regX", v);
    } else {
      uint16_t v = INS_GETA10(ca.ins);
      MOV_REG16_IMM("regX", v);
      cycles++;
    }
    UPDATE_NZ_X(ca.X);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xAE) { // ldx addr
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regX], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regX], ax\n");
    }
    UPDATE_NZ_X(ca.X);
    ADD_CYCLES(4);
  } else
  if (op == 0xBE) { // ldx addr, y
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regX], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regX], ax\n");
      cycles++;
    }
    UPDATE_NZ_X(ca.X);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xA6) { // ldx dp
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regX], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regX], ax\n");
      cycles++;
    }
    UPDATE_NZ_X(ca.X);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xB6) { // ldx dp, y
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    E->raw("  and rcx, 0xFFFF\n");
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regX], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regX], ax\n");
      cycles++;
    }
    UPDATE_NZ_X(ca.X);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xA0) { // ldy #imm
    if (ca.X) {
      uint8_t v = INS_GETA0(ca.ins);
      MOV_REG8_IMM("regY", v);
    } else {
      uint16_t v = INS_GETA10(ca.ins);
      MOV_REG16_IMM("regY", v);
    }
    UPDATE_NZ_Y(ca.X);
    ADD_CYCLES(2);
  } else
  if (op == 0xAC) { // ldy addr
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regY], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regY], ax\n");
    }
    UPDATE_NZ_Y(ca.X);
    ADD_CYCLES(4);
  } else
  if (op == 0xBC) { // ldy addr, x
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regY], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regY], ax\n");
      cycles++;
    }
    UPDATE_NZ_Y(ca.X);
    ADD_CYCLES(cycles);
  } else
  if (op == 0xA4) { // ldy dp
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regY], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regY], ax\n");
    }
    UPDATE_NZ_Y(ca.X);
    ADD_CYCLES(3);
  } else
  if (op == 0xB4) { // ldy dp, x
    int cycles = 4;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    if (ca.X) {
      CALL_FUNCTION_STK("__READ8");
      E->raw("  mov byte [rel regY], al\n");
    } else {
      CALL_FUNCTION_STK("__READ16");
      E->raw("  mov word [rel regY], ax\n");
      cycles++;
    }
    UPDATE_NZ_Y(ca.X);
    ADD_CYCLES(cycles);
  } else
  if (op == 0x85) { // sta dp
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    E->raw("  movzx rdx, word [rel regA]\n");
    if (ca.M) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x95) { // sta dp, X
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    E->raw("  movzx rdx, word [rel regA]\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(4);
  } else
  if (op == 0x92) { // sta (dp)
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    E->raw("  movzx rdx, word [rel regA]\n");
    if (ca.M) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x91) { // sta (dp), y
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    E->raw("  movzx rdx, word [rel regA]\n");
    if (ca.M) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x81) { // sta (dp, x)
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    E->raw("  movzx rdx, word [rel regA]\n");
    if (ca.M) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x87) { // sta [dp] (Long)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    if (ca.M) {
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x8D) { // sta addr
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    E->raw("  movzx rdx, word [rel regA]\n");
    if (ca.M) {
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x9D) { // sta addr, x
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    if (ca.M) {
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x99) { // sta addr, y
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x97) { // sta [dp], y (Long)
    int cycles = 6;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    if (ca.M) {
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x83) { // sta sr, s
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    E->raw("  movzx rdx, word [rel regA]\n");
    if (ca.M) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x93) { // sta (sr, s), y
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_SR(VR_ARG0, offset);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  movzx rcx, byte [rel regDBR]\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  add rcx, rax\n");
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    E->raw("  movzx rdx, word [rel regA]\n");
    if (ca.M) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x8E) { // stx addr
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    E->raw("  movzx rdx, word [rel regX]\n");
    if (ca.X) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x86) { // stx dp
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    E->raw("  movzx rdx, word [rel regX]\n");
    if (ca.X) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x96) { // stx dp, y
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regY");
    E->raw("  and rcx, 0xFFFF\n");
    E->raw("  movzx rdx, word [rel regX]\n");
    if (ca.X) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x8C) { // sty addr
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    E->raw("  movzx rdx, word [rel regY]\n");
    if (ca.X) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x84) { // sty dp
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    E->raw("  movzx rdx, word [rel regY]\n");
    if (ca.X) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x94) { // sty dp, x
    int cycles = 3;
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    E->raw("  movzx rdx, word [rel regY]\n");
    if (ca.X) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x64) { // stz dp
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    LOAD_IMM(VR_ARG1, 0);
    if (ca.M) {
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(3);
  } else
  if (op == 0x74) { // stz dp, x
    uint8_t offset = INS_GETA0(ca.ins);
    LOAD_DP(VR_ARG0, offset);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    LOAD_IMM(VR_ARG1, 0);
    if (ca.M) {
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
    }
    ADD_CYCLES(3);
  } else
  if (op == 0x9C) { // stz addr
    int cycles = 4;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    LOAD_IMM(VR_ARG1, 0);
    if (ca.M) {
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x9E) { // stz addr, x
    int cycles = 5;
    uint16_t address = INS_GETA10(ca.ins);
    LOAD_DBR_ADDR(VR_ARG0, address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    LOAD_IMM(VR_ARG1, 0);
    if (ca.M) {
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x8F) { // sta long
    int cycles = 5;
    uint32_t address = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", address);
    if (ca.M) {
      E->raw("  movzx rdx, byte [rel regA]\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      E->raw("  movzx rdx, word [rel regA]\n");
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x9F) { // sta long, x
    int cycles = 5;
    uint32_t address = INS_GETA210(ca.ins);
    E->raw("  mov rcx, 0x%06X\n", address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  movzx rdx, word [rel regA]\n");
    if (ca.M) {
      E->raw("  and rdx, 0xFF\n");
      CALL_FUNCTION_STK("__WRITE8");
    } else {
      CALL_FUNCTION_STK("__WRITE16");
      cycles++;
    }
    ADD_CYCLES(cycles);
  } else
  if (op == 0x4C) { // jmp addr
    uint32_t address = INS_GETA10(ca.ins);
    address = (ca.pc & 0xFF0000) | address;
    ADD_CYCLES(3);
    E->raw("  mov rcx, 0x%06X\n", address);
    CALL_FUNCTION_STK("pc_map");
    E->raw("  mov rcx, rax\n");
    E->raw("  mov rbx, 0x%06X\n", ca.pc);
    E->raw("  jmp __CALL_ADDRESS\n");
  } else
  if (op == 0x6C) { // jmp (addr)
    uint32_t address = INS_GETA10(ca.ins);
    ADD_CYCLES(5);
    E->raw("  mov rcx, 0x%04X\n", address);
    CALL_FUNCTION_STK("__READ16");
    E->raw("  or rax, 0x%06X\n", ca.pc & 0xFF0000);
    E->raw("  mov rcx, rax\n");
    CALL_FUNCTION_STK("pc_map");
    E->raw("  mov rcx, rax\n");
    E->raw("  mov rbx, 0x%06X\n", ca.pc);
    E->raw("  jmp __CALL_ADDRESS\n");
  } else
  if (op == 0x7C) { // jmp (addr, x)
    uint32_t address = INS_GETA10(ca.ins);
    ADD_CYCLES(6);
    E->raw("  mov rcx, 0x%04X\n", address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  mov rcx, rax\n");
    E->raw("  or rcx, 0x%06X\n", ca.pc & 0xFF0000);
    E->raw("  mov rbx, 0x%06X\n", ca.pc);
    E->raw("  jmp __CALL_ADDRESS\n");
  } else
  if (op == 0x22) { // jsl long
    uint32_t address = pc_map(INS_GETA210(ca.ins));
    ADD_CYCLES(8);
    E->raw("  mov rcx, 0x%02X\n", ((ca.pc + 3) >> 16) & 0xFF);
    CALL_FUNCTION_STK("__PUSH8");
    E->raw("  mov rcx, 0x%02X\n", ((ca.pc + 3) >> 8) & 0xFF);
    CALL_FUNCTION_STK("__PUSH8");
    E->raw("  mov rcx, 0x%02X\n", (ca.pc + 3) & 0xFF);
    CALL_FUNCTION_STK("__PUSH8");
    E->raw("  mov rcx, 0x%06X\n", address);
    E->raw("  mov rbx, 0x%06X\n", ca.pc);
    E->raw("  jmp __CALL_ADDRESS\n");
  } else
  if (op == 0x20) { // jsr addr
    uint32_t address = INS_GETA10(ca.ins);
    address = pc_map((ca.pc & 0xFF0000) | address);
    ADD_CYCLES(6);
    E->raw("  mov rcx, 0x%02X\n", ((ca.pc + 2) >> 8) & 0xFF);
    CALL_FUNCTION_STK("__PUSH8");
    E->raw("  mov rcx, 0x%02X\n", (ca.pc + 2) & 0xFF);
    CALL_FUNCTION_STK("__PUSH8");
    E->raw("  mov rcx, 0x%06X\n", address);
    E->raw("  mov rbx, 0x%06X\n", ca.pc);
    E->raw("  jmp __CALL_ADDRESS\n");
  } else
  if (op == 0xFC) { // jsr (addr, x)
    uint32_t address = INS_GETA10(ca.ins);
    ADD_CYCLES(3);
    E->raw("  mov rcx, 0x%04X\n", address);
    APPLY_IDX_OFFSET(VR_ARG0, VR_TMP, "regX");
    E->raw("  and rcx, 0xFFFF\n");
    CALL_FUNCTION_STK("__READ16");
    E->raw("  mov rcx, 0x%06X\n", ca.pc & 0xFF0000);
    E->raw("  or rcx, rax\n");
    E->raw("  mov r12, rcx\n");
    E->raw("  mov rcx, 0x%02X\n", ((ca.pc + 2) >> 8) & 0xFF);
    CALL_FUNCTION_STK("__PUSH8");
    E->raw("  mov rcx, 0x%02X\n", (ca.pc + 2) & 0xFF);
    CALL_FUNCTION_STK("__PUSH8");
    E->raw("  mov rcx, r12\n");
    CALL_FUNCTION_STK("pc_map");
    E->raw("  mov rcx, rax\n");
    E->raw("  mov rbx, 0x%06X\n", ca.pc);
    E->raw("  jmp __CALL_ADDRESS\n");
  } else
  if (op == 0x5C) { // jml long
    uint32_t address = INS_GETA210(ca.ins);
    ADD_CYCLES(4);
    LOAD_IMM(VR_ARG0, pc_map(address));
    E->raw("  mov rbx, 0x%06X\n", ca.pc);
    E->raw("  jmp __CALL_ADDRESS\n");
  } else
  if (op == 0xDC) { // jml [addr]
    int cycles = 6;
    uint16_t address = INS_GETA10(ca.ins);
    ADD_CYCLES(cycles);
    E->raw("  mov rcx, 0x%04X\n", address);
    CALL_FUNCTION_STK("__READ24");
    E->raw("  mov rcx, rax\n");
    CALL_FUNCTION_STK("pc_map");
    E->raw("  mov rcx, rax\n");
    E->raw("  mov rbx, 0x%06X\n", ca.pc);
    E->raw("  jmp __CALL_ADDRESS\n");
  } else {
    E->raw("  ; UNKNOWN %08X\n", ca.ins);
    E->raw("  mov rcx, 0x%08X\n", ca.pc);
    E->raw("  mov rdx, 0x%08X\n", ca.ins);
    E->raw("  call __PRINT_INS\n");
  }
}

