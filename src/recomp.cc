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
  
  E->raw("  section .text\n");
  printf("__CALL_ADDRESS:\n");
  E->raw("  mov r12, rcx\n");
  E->raw("  sub rsp, 32\n");
  E->raw("  call __CALL_SHOW\n");
  E->raw("  add rsp, 32\n");
  E->raw("  mov rcx, r12\n");
  E->raw("  and rcx, 0xFFFFFF\n");
  int i = 0;
  for (auto r : routines) {
    E->raw("  cmp rcx, 0x%06X\n", r);
    E->raw("  jne .next_%d\n", i);
    E->raw("  jmp Label_%06X\n", r);
    printf(".next_%d:\n", i);
    i++;
  }
  E->raw("  mov rdx, rbx\n");
  E->raw("  call __JUMP_FAILED\n\n");
  
  printf("__CPUSync:\n");
  E->raw("  sub rsp, 32\n");
  E->raw("  call Render\n");
  E->raw("  add rsp, 32\n");
  E->raw("  \n");
  // E->raw("  mov al, byte [rel inNMI]\n");
  // E->raw("  cmp al, 0\n");
  // E->raw("  jne .return\n");
  // E->raw("  \n");
  E->raw("  mov rax, [rel NMI]\n");
  E->raw("  cmp al, 0\n");
  E->raw("  je .return\n");
  E->raw("  \n");
  E->raw("  mov al, [rel io_RDNMI]\n");
  E->raw("  or al, 0x80\n");
  E->raw("  mov [rel io_RDNMI], al\n");
  E->raw("  \n");
  E->raw("  mov byte [rel NMI], 0\n");
  E->raw("  mov al, [rel io_NMITIMEN]\n");
  E->raw("  and al, 0x80\n");
  E->raw("  cmp al, 0\n");
  E->raw("  je .return\n");
  E->raw("  \n");
  E->raw("  add rsp, 32\n");
  E->raw("  pop rax ; pop return address\n");
  E->raw("  \n");
  E->raw("  mov byte [rel inNMI], 1\n");
  E->raw("  mov rax, r12\n");
  E->raw("  shr rax, 16\n");
  E->raw("  mov cl, al\n");
  CALL_FUNCTION_STK("__PUSH8");
  E->raw("  mov rax, r12\n");
  E->raw("  mov cl, ah\n");
  CALL_FUNCTION_STK("__PUSH8");
  E->raw("  mov rax, r12\n");
  E->raw("  mov cl, al\n");
  CALL_FUNCTION_STK("__PUSH8");
  CALL_FUNCTION_STK("__PHP");
  // MOV_REG8_IMM("I_Flag", 1); // ?
  // MOV_REG8_IMM("D_Flag", 0);
  E->raw("  jmp Label_NMI\n");
  E->raw("  \n");
  E->label(".return");   /* ".return:" on yasm, ".Lreturn:" on GNU as */
  E->raw("  ret\n\n");
  
  printf("\n");
  E->raw("  global Start\n");
  printf("Start:\n");
  E->raw("  mov byte [rel MapMode], %d\n", MapMode);
  E->raw("  ret\n");
  
  std::set<uint32_t> vram_addrs;
  int skips = 0;
  for (auto ca : addr) {
    if (is_routines(ca.pc)) {
      printf("\n");
      if (ca.pc == ResetVector) {
        E->raw("  global Label_Reset\n");
        printf("Label_Reset:\n");
      } else
      if (ca.pc == NMIVector) {
        E->raw("  global Label_NMI\n");
        printf("Label_NMI:\n");
        FoundNMI = 1;
      } else
      if (ca.pc == BRKVector) {
        E->raw("  global Label_BRK\n");
        printf("Label_BRK:\n");
        FoundBRK = 1;
      }
      if (ca.pc == COPVector) {
        E->raw("  global Label_COP\n");
        printf("Label_COP:\n");
        FoundCOP = 1;
      }
      if (in_wram(ca.pc)) {
        if (std::find(vram_addrs.begin(), vram_addrs.end(), ca.pc) == vram_addrs.end()) {
          E->raw("  global Label_%06X\n", ca.pc);
          printf("Label_%06X:\n", ca.pc);
          vram_addrs.insert(ca.pc);
        }
      } else {
        E->raw("  global Label_%06X\n", ca.pc);
        printf("Label_%06X:\n", ca.pc);
      }
    }
    E->raw("  ; -- %06X --\n", ca.pc);
    if (in_wram(ca.pc)) {
      E->raw("  mov rcx, 0x%06X\n", ca.pc);
      E->raw("  sub rsp, 32\n");
      E->raw("  call __READ_INS\n"); // a little risky :(
      E->raw("  add rsp, 32\n");
      E->raw("  cmp eax, 0x%08X\n", ca.ins);
      E->raw("  jne Label_%06X_skip%d\n", ca.pc, skips);
    }
    E->raw("  mov r12, 0x%06X\n", ca.pc);
    E->raw("  sub rsp, 32\n");
    E->raw("  call __CPUSync\n");
    E->raw("  add rsp, 32\n");
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
    E->raw("  global Label_NMI\n");
    printf("Label_NMI:\n");
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
    E->raw("  global Label_BRK\n");
    printf("Label_BRK:\n");
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
    E->raw("  global Label_COP\n");
    printf("Label_COP:\n");
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
