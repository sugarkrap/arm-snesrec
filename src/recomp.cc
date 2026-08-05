/*
 * recomp.cc -- driver: reads the trace, resolves interrupt vectors from the
 * ROM header, emits the prologue and dispatch table, then walks the trace.
 * Split out of the original single-file recomp.cc; contents unchanged.
 */
#include <string.h>
#include <algorithm>
#include <functional>

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
   * usage: recomp [--target x86_64|x86_64-sysv|armv5] <trace> <rom>
   * Default stays x86_64 so existing invocations and the golden check are
   * unaffected.
   */
  if (argc > 2 && strcmp(argv[1], "--target") == 0) {
    if (strcmp(argv[2], "armv5") == 0) {
      E = &emit_armv5;
    } else if (strcmp(argv[2], "x86_64") == 0) {
      E = &emit_x86_64;
    } else if (strcmp(argv[2], "x86_64-sysv") == 0) {
      E = &emit_x86_64_sysv;
    } else {
      fprintf(stderr, "unknown target '%s' (want x86_64, x86_64-sysv or armv5)\n", argv[2]);
      return -1;
    }
    argv += 2;
    argc -= 2;
  }
  if (argc < 3) {
    fprintf(stderr, "usage: recomp [--target x86_64|x86_64-sysv|armv5] <trace> <rom>\n");
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

  /*
   * Drop routines that were never traced.
   *
   * The interrupt vectors come from the ROM header, not the trace, and a ROM
   * can leave one unused -- FF6's reads as 0xFFFF, which maps to C0FFFF. That
   * address gets a compare in the dispatch chain and a jump to Label_C0FFFF,
   * but no code was generated for it, so the result is an undefined reference
   * at LINK time pointing at a synthetic address with no obvious origin.
   *
   * An address with no generated code cannot be dispatched to. Removing it
   * lets the chain fall through to __JUMP_FAILED, which is the runtime's
   * existing answer for "this address is not in the trace".
   */
  {
    std::set<uint32_t> traced;
    for (auto ca : addr)
      traced.insert(ca.pc);

    std::vector<uint32_t> kept;
    for (auto r : routines)
      if (traced.count(r))
        kept.push_back(r);

    if (kept.size() != routines.size())
      fprintf(stderr, "recomp: %zu of %zu routines have no traced code; "
                      "they will dispatch to __JUMP_FAILED\n",
              routines.size() - kept.size(), routines.size());
    routines = kept;

    /*
     * Every traced address is a jump target, not just the entry points.
     *
     * `routines` held only the trace's type-1 rows, and that one set drives
     * BOTH which addresses get a label and which get a dispatch entry -- so an
     * address the trace covered but never entered from outside had neither. A
     * static `JMP $6D58` at C36D55 could then not be emitted as a direct jump
     * (no label to name) and fell back to __CALL_ADDRESS, which had no entry
     * for it either, so it died in __JUMP_FAILED -- on an address whose code
     * was sitting in the very next emitted block. RTS/RTL are worse off still,
     * since a return lands mid-routine by definition.
     *
     * Every traced instruction starts a block that was generated, so every one
     * of them can be named and dispatched to. The dispatch is a binary search,
     * so going from ~1.6k entries to ~17k costs about three more compares.
     */
    routines.assign(traced.begin(), traced.end());
  }

  E->prologue();
  
  E->label("__CALL_ADDRESS");
  E->mov_reg_reg(VR_SAVE, VR_ARG0);
  CALL_FUNCTION_STK("__CALL_SHOW");
  E->mov_reg_reg(VR_ARG0, VR_SAVE);
  E->alu_imm(EA_AND, VR_ARG0, 0xFFFFFF);
  /*
   * DISPATCH.
   *
   * This runs on every indirect transfer -- every RTS, RTL, interrupt return
   * and computed jump -- so its cost is paid constantly. A linear chain of
   * compares costs 3 instructions per routine, which for a real trace meant
   * ~4400 instructions on a miss and grows with every address the trace
   * covers: tracing MORE of a game would have made the result slower, which
   * is precisely backwards.
   *
   * A binary search over the sorted addresses turns that into about
   * log2(N) compares -- 11 rather than 1455 for FF6 -- and stays flat as
   * traces grow.
   *
   * The compare must be UNSIGNED (EC_AE): these are 24-bit addresses, but they
   * are held in a full register and compared against constants, and a signed
   * ordering would be wrong the moment one exceeded 0x7FFFFFFF.
   */
  std::sort(routines.begin(), routines.end());
  routines.erase(std::unique(routines.begin(), routines.end()), routines.end());

  {
    int label_id = 0;
    /* Explicit stack rather than recursion: emission order must stay
     * deterministic for the golden diff. */
    std::function<void(size_t, size_t)> emit_range =
      [&](size_t lo, size_t hi) {
        if (hi - lo <= 4) {
          for (size_t k = lo; k < hi; k++) {
            int id = label_id++;
            E->cmp_imm_w(VR_ARG0, routines[k], EW24);
            E->jump(EC_NE, ".next_%d", id);
            E->jump(EC_ALWAYS, "Label_%06X", routines[k]);
            E->label(".next_%d", id);
          }
          return;
        }
        size_t mid = lo + (hi - lo) / 2;
        int id = label_id++;
        E->cmp_imm_w(VR_ARG0, routines[mid], EW24);
        E->jump(EC_AE, ".hi_%d", id);
        emit_range(lo, mid);
        E->jump(EC_ALWAYS, ".miss_%d", id);
        E->label(".hi_%d", id);
        emit_range(mid, hi);
        E->label(".miss_%d", id);
      };
    emit_range(0, routines.size());
  }
  E->mov_reg_reg(VR_ARG1, VR_PC);
  E->call_sym("__JUMP_FAILED");
  printf("\n");
  
  E->label("__CPUSync");
  E->frame_enter();
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
  E->frame_discard();
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
  E->frame_return();
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
      /*
       * Code in WRAM can be rewritten at runtime, so the statically compiled
       * version is only valid if the bytes still match what was traced: read
       * the instruction back and skip this block if it has changed.
       *
       * The compare is 32-bit because __READ_INS returns uint32_t and the ABI
       * leaves the upper half undefined.
       */
      E->mov_reg_immw(VR_ARG0, ca.pc, EW24);
      CALL_FUNCTION_STK("__READ_INS");
      E->cmp_imm_w(VR_TMP, ca.ins, EW32);
      E->jump(EC_NE, "Label_%06X_patched%d", ca.pc, skips);
    }
    /* Per-instruction preamble: stash the guest PC where __CPUSync and the
     * dispatch can find it, then sync. Emitted once per traced instruction,
     * so on its own it accounted for ~4100 of the ARM backend's unported
     * markers. */
    E->mov_reg_immw(VR_SAVE, ca.pc, EW24);
    CALL_FUNCTION_STK("__CPUSync");
    decode_65C816(ca);
    if (in_wram(ca.pc)) {
      /*
       * `_skip` is the JOIN point -- the executed path falls into it and the
       * guard used to branch straight to it -- so the guard's failure path had
       * no handler of its own: it simply continued into the next emitted
       * block. That block is whatever the recompiler laid down next, ordered
       * by first encounter in the trace, which has nothing to do with where
       * the guest was going. FF6 rewrites its NMI vector at $001500 into a JML
       * trampoline (see __WRAM_RETARGET), so from frame one every NMI fell
       * through two stale blocks into an unrelated routine.
       *
       * Give the failure path a real handler at `_patched`: ask the runtime
       * what the live bytes say, and dispatch on the address actually stored
       * there. Zero means "not a jump" and rejoins at `_skip`, preserving the
       * old behaviour, so this can only improve on it. The extra unconditional
       * jump into `_skip` is dead whenever the instruction body ends in
       * control flow of its own, which is most of them.
       */
      E->jump(EC_ALWAYS, "Label_%06X_skip%d", ca.pc, skips);
      E->label("Label_%06X_patched%d", ca.pc, skips);
      E->mov_reg_immw(VR_ARG0, ca.pc, EW24);
      CALL_FUNCTION_STK("__WRAM_RETARGET");
      E->cmp_imm_w(VR_TMP, 0, EW32);
      E->jump(EC_EQ, "Label_%06X_skip%d", ca.pc, skips);
      E->mov_reg_reg(VR_ARG0, VR_TMP);
      E->mov_reg_immw(VR_PC, ca.pc, EW24);
      E->jump(EC_ALWAYS, "__CALL_ADDRESS");
      E->label("Label_%06X_skip%d", ca.pc, skips);
      skips++;
    }
    if ((ca.pc & 0xFFFF) == 0xFFFF) {
      /*
       * PC wraps within the bank: 0xFFFF + 1 is 0x0000 of the SAME bank.
       *
       * A direct jump is only legal if that address was traced and got a
       * label. It usually was not -- running off the end of a bank is exactly
       * the kind of path a trace does not cover -- and emitting the jump
       * anyway produces an undefined reference at LINK time, with nothing to
       * say which uncovered address caused it. FF6 hits this at C2FFF6.
       *
       * Untraced targets already have a runtime answer: __CALL_ADDRESS
       * dispatches on the address and falls through to __JUMP_FAILED when it
       * knows nothing about it. Route through that instead, so an uncovered
       * path reports itself when it is taken rather than breaking the build.
       */
      uint32_t wrap = (ca.pc & 0xFF0000);
      if (is_routines(wrap)) {
        E->jump(EC_ALWAYS, "Label_%06X", wrap);
      } else {
        E->mov_reg_immw(VR_ARG0, wrap, EW24);
        E->mov_reg_immw(VR_PC, ca.pc, EW24);
        E->jump(EC_ALWAYS, "__CALL_ADDRESS");
      }
    }
  }
  
  if (!NMIVector || !FoundNMI) {
    E->global_sym("Label_NMI");
    E->label("Label_NMI");
    E->store_sym_imm("inNMI", 0, EW8);
    CALL_FUNCTION_STK("__PLP");
    CALL_FUNCTION_STK("__PULL8");
    E->mov_reg_reg(VR_PC, VR_TMP);
    E->alu_imm(EA_AND, VR_PC, 0xFF);
    CALL_FUNCTION_STK("__PULL8");
    E->alu_imm(EA_AND, VR_TMP, 0xFF);
    E->alu_imm(EA_SHL, VR_TMP, 8);
    E->alu_reg(EA_OR, VR_PC, VR_TMP);
    E->alu_imm(EA_AND, VR_PC, 0xFFFF);
    CALL_FUNCTION_STK("__PULL8");
    E->mov_reg_reg(VR_ARG0, VR_TMP);
    E->alu_imm(EA_AND, VR_ARG0, 0xFF);
    E->alu_imm(EA_SHL, VR_ARG0, 16);
    E->alu_reg(EA_OR, VR_ARG0, VR_PC);
    E->mov_reg_immw(VR_PC, 0xFFFFF0, EW24);
    E->jump(EC_ALWAYS, "__CALL_ADDRESS");
    printf("\n");
  }
  if (!BRKVector || !FoundBRK) {
    E->global_sym("Label_BRK");
    E->label("Label_BRK");
    E->store_sym_imm("inNMI", 0, EW8);
    CALL_FUNCTION_STK("__PLP");
    CALL_FUNCTION_STK("__PULL8");
    E->mov_reg_reg(VR_PC, VR_TMP);
    E->alu_imm(EA_AND, VR_PC, 0xFF);
    CALL_FUNCTION_STK("__PULL8");
    E->alu_imm(EA_AND, VR_TMP, 0xFF);
    E->alu_imm(EA_SHL, VR_TMP, 8);
    E->alu_reg(EA_OR, VR_PC, VR_TMP);
    E->alu_imm(EA_AND, VR_PC, 0xFFFF);
    CALL_FUNCTION_STK("__PULL8");
    E->mov_reg_reg(VR_ARG0, VR_TMP);
    E->alu_imm(EA_AND, VR_ARG0, 0xFF);
    E->alu_imm(EA_SHL, VR_ARG0, 16);
    E->alu_reg(EA_OR, VR_ARG0, VR_PC);
    E->mov_reg_immw(VR_PC, 0xFFFFF1, EW24);
    E->jump(EC_ALWAYS, "__CALL_ADDRESS");
    printf("\n");
  }
  if (!COPVector || !FoundCOP) {
    E->global_sym("Label_COP");
    E->label("Label_COP");
    E->store_sym_imm("inNMI", 0, EW8);
    CALL_FUNCTION_STK("__PLP");
    CALL_FUNCTION_STK("__PULL8");
    E->mov_reg_reg(VR_PC, VR_TMP);
    E->alu_imm(EA_AND, VR_PC, 0xFF);
    CALL_FUNCTION_STK("__PULL8");
    E->alu_imm(EA_AND, VR_TMP, 0xFF);
    E->alu_imm(EA_SHL, VR_TMP, 8);
    E->alu_reg(EA_OR, VR_PC, VR_TMP);
    E->alu_imm(EA_AND, VR_PC, 0xFFFF);
    CALL_FUNCTION_STK("__PULL8");
    E->mov_reg_reg(VR_ARG0, VR_TMP);
    E->alu_imm(EA_AND, VR_ARG0, 0xFF);
    E->alu_imm(EA_SHL, VR_ARG0, 16);
    E->alu_reg(EA_OR, VR_ARG0, VR_PC);
    E->mov_reg_immw(VR_PC, 0xFFFFF2, EW24);
    E->jump(EC_ALWAYS, "__CALL_ADDRESS");
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
