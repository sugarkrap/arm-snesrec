/*
 * recomp.cc -- driver: reads the trace, resolves interrupt vectors from the
 * ROM header, emits the prologue and dispatch table, then walks the trace.
 * Split out of the original single-file recomp.cc; contents unchanged.
 */
#include <string.h>

#include "snesrec.h"
#include "emit.h"

std::multiset<CodeAddr> addr;
std::vector<uint32_t> routines;
uint32_t ResetVector = 0;
uint32_t NMIVector = 0;
uint32_t BRKVector = 0;
uint32_t COPVector = 0;
int MapMode = 0;
int FoundNMI = 0;
int FoundBRK = 0;
int FoundCOP = 0;

unsigned long armv5_unported_sites(void);

int main(int argc, char **argv)
{
  /*
   * usage: recomp [--target x86_64|armv5] <trace> <rom>
   * Default stays x86_64 so existing invocations and the golden check are
   * unaffected.
   */
  if (argc > 2 && strcmp(argv[1], "--target") == 0) {
    if (strcmp(argv[2], "armv5") == 0) {
      E = &emit_armv5;
    } else if (strcmp(argv[2], "x86_64") == 0) {
      E = &emit_x86_64;
    } else {
      fprintf(stderr, "unknown target '%s' (want x86_64 or armv5)\n", argv[2]);
      return -1;
    }
    argv += 2;
    argc -= 2;
  }
  if (argc < 3) {
    fprintf(stderr, "usage: recomp [--target x86_64|armv5] <trace> <rom>\n");
    return -1;
  }

  FILE *f = fopen(argv[1], "r");
  if (!f) {
    printf("failed to open %s\n", argv[1]);
    return -1;
  }
  
  uint32_t headerloc;
  fscanf(f, "%X", &headerloc);
  fscanf(f, "%d", &MapMode);
  
  CodeAddr ca0;
  while((fscanf(f, "%d %d %d %X %X %X", &ca0.M, &ca0.X, &ca0.type, &ca0.K, &ca0.pc, &ca0.ins)) == 6) {
    addr.insert(ca0);
  }
  fclose(f);
  
  // Get Interrupts
  FILE *from = fopen(argv[2], "rb");
  
  fseek(from, headerloc + 0x3C, SEEK_SET); // Reset Vector
  fread(&ResetVector, 1, 2, from);
  if (MapMode == 0) {
    ResetVector += 0x800000;
  } else
  if (MapMode == 1) {
    ResetVector += 0xC00000;
  }
  routines.push_back(ResetVector);
  
  fseek(from, headerloc + 0x2A, SEEK_SET); // NMI Vector
  fread(&NMIVector, 1, 2, from);
  if (NMIVector) {
    if (MapMode == 0 && NMIVector >= 0x8000) {
      NMIVector += 0x800000;
    } else
    if (MapMode == 1) {
      NMIVector += 0xC00000;
    }
    routines.push_back(NMIVector);
  }
  
  fseek(from, headerloc + 0x26, SEEK_SET); // BRK Vector
  fread(&BRKVector, 1, 2, from);
  if (BRKVector) {
    if (MapMode == 0 && BRKVector >= 0x8000) {
      // We dont remap RAM
      BRKVector += 0x800000;
    } else
    if (MapMode == 1) {
      BRKVector += 0xC00000;
    }
    routines.push_back(BRKVector);
  }
  
  fseek(from, headerloc + 0x24, SEEK_SET); // COP Vector
  fread(&COPVector, 1, 2, from);
  if (COPVector) {
    if (MapMode == 0 && COPVector >= 0x8000) {
      // We dont remap RAM
      COPVector += 0x800000;
    } else
    if (MapMode == 1) {
      COPVector += 0xC00000;
    }
    routines.push_back(COPVector);
  }
  
  fclose(from);
  
  for (auto ca : addr) {
    if (ca.type == 1) { // ROUTINE
      routines.push_back(ca.pc);
    }
  }
  
  E->prologue();
  
  E->label("__CALL_ADDRESS");
  E->mov_reg_reg(VR_SAVE, VR_ARG0);
  CALL_FUNCTION_STK("__CALL_SHOW");
  E->mov_reg_reg(VR_ARG0, VR_SAVE);
  E->alu_imm(EA_AND, VR_ARG0, 0xFFFFFF);
  int i = 0;
  for (auto r : routines) {
    E->cmp_imm_w(VR_ARG0, r, EW24);
    E->jump(EC_NE, ".next_%d", i);
    E->jump(EC_ALWAYS, "Label_%06X", r);
    E->label(".next_%d", i);
    i++;
  }
  E->mov_reg_reg(VR_ARG1, VR_PC);
  E->call_sym("__JUMP_FAILED");
  printf("\n");
  
  E->label("__CPUSync");
  CALL_FUNCTION_STK("Render");
  printf("  \n");
  // E->raw("  mov al, byte [rel inNMI]\n");
  // E->raw("  cmp al, 0\n");
  // E->raw("  jne .return\n");
  // E->raw("  \n");
  E->load_sym(VR_TMP, "NMI", EW8);
  E->cmp_imm(VR_TMP, 0);
  E->jump(EC_EQ, ".return");
  printf("  \n");
  E->load_sym(VR_TMP, "io_RDNMI", EW8);
  E->alu_imm(EA_OR, VR_TMP, 0x80);
  E->store_sym("io_RDNMI", VR_TMP, EW8);
  printf("  \n");
  E->store_sym_imm("NMI", 0, EW8);
  E->load_sym(VR_TMP, "io_NMITIMEN", EW8);
  E->alu_imm(EA_AND, VR_TMP, 0x80);
  E->cmp_imm(VR_TMP, 0);
  E->jump(EC_EQ, ".return");
  printf("  \n");
  E->raw("  add rsp, 32\n");
  E->raw("  pop rax ; pop return address\n");
  printf("  \n");
  E->store_sym_imm("inNMI", 1, EW8);
  E->mov_reg_reg(VR_ARG0, VR_SAVE);
  E->alu_imm(EA_SHR, VR_ARG0, 16);
  E->alu_imm(EA_AND, VR_ARG0, 0xFF);
  CALL_FUNCTION_STK("__PUSH8");
  E->mov_reg_reg(VR_ARG0, VR_SAVE);
  E->alu_imm(EA_SHR, VR_ARG0, 8);
  E->alu_imm(EA_AND, VR_ARG0, 0xFF);
  CALL_FUNCTION_STK("__PUSH8");
  E->mov_reg_reg(VR_ARG0, VR_SAVE);
  E->alu_imm(EA_AND, VR_ARG0, 0xFF);
  CALL_FUNCTION_STK("__PUSH8");
  CALL_FUNCTION_STK("__PHP");
  // MOV_REG8_IMM("I_Flag", 1); // ?
  // MOV_REG8_IMM("D_Flag", 0);
  E->jump(EC_ALWAYS, "Label_NMI");
  printf("  \n");
  E->label(".return");   /* ".return:" on yasm, ".Lreturn:" on GNU as */
  E->ret();
  printf("\n");
  
  printf("\n");
  E->global_sym("Start");
  E->label("Start");
  E->store_sym_imm("MapMode", MapMode, EW8);
  E->ret();
  
  std::set<uint32_t> vram_addrs;
  int skips = 0;
  for (auto ca : addr) {
    if (is_routines(ca.pc)) {
      printf("\n");
      if (ca.pc == ResetVector) {
        E->global_sym("Label_Reset");
        E->label("Label_Reset");
      } else
      if (ca.pc == NMIVector) {
        E->global_sym("Label_NMI");
        E->label("Label_NMI");
        FoundNMI = 1;
      } else
      if (ca.pc == BRKVector) {
        E->global_sym("Label_BRK");
        E->label("Label_BRK");
        FoundBRK = 1;
      }
      if (ca.pc == COPVector) {
        E->global_sym("Label_COP");
        E->label("Label_COP");
        FoundCOP = 1;
      }
      if (in_wram(ca.pc)) {
        if (std::find(vram_addrs.begin(), vram_addrs.end(), ca.pc) == vram_addrs.end()) {
          E->global_sym("Label_%06X", ca.pc);
          E->label("Label_%06X", ca.pc);
          vram_addrs.insert(ca.pc);
        }
      } else {
        E->global_sym("Label_%06X", ca.pc);
        E->label("Label_%06X", ca.pc);
      }
    }
    E->comment("-- %06X --", ca.pc);
    if (in_wram(ca.pc)) {
      E->raw("  mov rcx, 0x%06X\n", ca.pc);
      E->raw("  sub rsp, 32\n");
      E->raw("  call __READ_INS\n"); // a little risky :(
      E->raw("  add rsp, 32\n");
      E->raw("  cmp eax, 0x%08X\n", ca.ins);
      E->raw("  jne Label_%06X_skip%d\n", ca.pc, skips);
    }
    /* Per-instruction preamble: stash the guest PC where __CPUSync and the
     * dispatch can find it, then sync. Emitted once per traced instruction,
     * so on its own it accounted for ~4100 of the ARM backend's unported
     * markers. */
    E->mov_reg_immw(VR_SAVE, ca.pc, EW24);
    CALL_FUNCTION_STK("__CPUSync");
    decode_65C816(ca);
    if (in_wram(ca.pc)) {
      printf("Label_%06X_skip%d:\n", ca.pc, skips);
      skips++;
    }
    if ((ca.pc & 0xFFFF) == 0xFFFF) {
      // pc wraps
      E->raw("  jmp Label_%02X0000\n", ca.pc >> 16);
    }
  }
  
  if (!NMIVector || !FoundNMI) {
    E->global_sym("Label_NMI");
    E->label("Label_NMI");
    E->raw("  mov byte [rel inNMI], 0\n");
    CALL_FUNCTION_STK("__PLP");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  mov bl, al\n");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  mov bh, al\n");
    E->raw("  and rbx, 0xFFFF\n");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  movzx rcx, al\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  or rcx, rbx\n");
    E->raw("  mov rbx, 0xFFFFF0\n");
    E->raw("  jmp __CALL_ADDRESS\n\n");
  }
  if (!BRKVector || !FoundBRK) {
    E->global_sym("Label_BRK");
    E->label("Label_BRK");
    E->raw("  mov byte [rel inNMI], 0\n");
    CALL_FUNCTION_STK("__PLP");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  mov bl, al\n");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  mov bh, al\n");
    E->raw("  and rbx, 0xFFFF\n");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  movzx rcx, al\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  or rcx, rbx\n");
    E->raw("  mov rbx, 0xFFFFF1\n");
    E->raw("  jmp __CALL_ADDRESS\n\n");
  }
  if (!COPVector || !FoundCOP) {
    E->global_sym("Label_COP");
    E->label("Label_COP");
    E->raw("  mov byte [rel inNMI], 0\n");
    CALL_FUNCTION_STK("__PLP");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  mov bl, al\n");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  mov bh, al\n");
    E->raw("  and rbx, 0xFFFF\n");
    CALL_FUNCTION_STK("__PULL8");
    E->raw("  movzx rcx, al\n");
    E->raw("  shl rcx, 16\n");
    E->raw("  or rcx, rbx\n");
    E->raw("  mov rbx, 0xFFFFF2\n");
    E->raw("  jmp __CALL_ADDRESS\n");
  }
  if (E == &emit_armv5) {
    unsigned long n = armv5_unported_sites();
    if (n) {
      fprintf(stderr,
              "armv5: %lu unported emission sites -- output contains .error "
              "markers and will not assemble. grep UNPORTED for the list.\n", n);
    }
  }
  return 0;
}

int is_routines(uint32_t addr)
{
  return std::find(routines.begin(), routines.end(), addr) != routines.end();
}
