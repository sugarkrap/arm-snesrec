/*
 * snesrec.h -- types, trace record layout and globals shared across the
 * recompiler. Split out of the original single-file recomp.cc; contents
 * unchanged.
 */
#ifndef SNESREC_H
#define SNESREC_H

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <iostream>
#include <algorithm>
#include <vector>
#include <set>


typedef struct CodeAddr {
  int M, X, K;
  int type;
  uint32_t pc;
  uint32_t ins;
  
  bool operator<(const CodeAddr& other) const {
    if (pc != other.pc) { return pc < other.pc; }
    if (M != other.M) { return M < other.M; }
    return X != other.X;
  }
} CodeAddr;
extern std::multiset<CodeAddr> addr;
extern std::vector<uint32_t> routines;
extern uint32_t ResetVector;
extern uint32_t NMIVector;
extern uint32_t BRKVector;
extern uint32_t COPVector;
extern int MapMode;
extern int FoundNMI;
extern int FoundBRK;
extern int FoundCOP;

// INSTRUCTION : OP + A0 + A1 + A2
#define INS_OP(ins) ((ins >> 24) & 0xFF)
#define INS_GETA0(ins) ((ins >> 16) & 0xFF)                                             // A0
#define INS_GETA1(ins) ((ins >> 8) & 0xFF)                                              // A1
#define INS_GETA10(ins) ((ins & 0xFF00) | ((ins >> 16) & 0xFF))                         // A1+A0
#define INS_GETA210(ins) (((ins & 0xFF) << 16) | (ins & 0xFF00) | ((ins >> 16) & 0xFF)) // A2+A1+A0

void decode_65C816(CodeAddr ca);
int is_routines(uint32_t addr);

uint32_t pc_to_LoRom(uint32_t pc);
uint32_t pc_to_HiRom(uint32_t pc);
uint32_t pc_to_dummy(uint32_t pc);
int in_wram(uint32_t pc);   /* was static; now used across the split */
uint32_t pc_map(uint32_t pc);

#endif /* SNESREC_H */
