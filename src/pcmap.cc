/*
 * pcmap.cc -- guest PC to ROM offset mapping (LoROM / HiROM / WRAM).
 * Split out of recomp.cc; contents unchanged.
 */
#include "snesrec.h"

int in_wram(uint32_t pc)
{
  uint8_t k = (pc >> 16) & 0xFF;
  uint16_t p = pc & 0xFFFF;
  if (k == 0x7E || k == 0x7F) {
    return 1;
  }
  /* 80, not 0x80, was a typo: it made banks $50-$7D below $2000 look like
   * WRAM when HiROM maps them to ROM across the whole bank. FF6 executes in
   * none of those banks, so this changes nothing for it -- fixed because the
   * next ROM will not be so lucky. */
  if (k < 0x40 || (k >= 0x80 && k < 0xC0)) {
    if (p < 0x2000) {
      return 1;
    }
  }
  return 0;
}

uint32_t pc_to_HiRom(uint32_t pc)
{
  // map addresses to $C00000-$FFFFFF
  //
  // Only the ROM window may be folded into $C0+. In banks $00-$3F and
  // $80-$BF, HiROM exposes ROM at $8000-$FFFF ONLY -- the bottom of those
  // banks is the WRAM mirror ($0000-$1FFF) and then I/O, and none of it is
  // ROM. Folding a whole bank unconditionally rewrote $001500 -- WRAM, where
  // FF6 puts a routine it jumps to from the NMI vector -- into $C01500, an
  // address that is never executed and so has no generated code. The result
  // was __JUMP_FAILED on a target that WAS in the trace, listed under its
  // real address. Banks $40-$7D have no such split: HiROM maps them to ROM
  // across the full 64K, so that arm needs no window check.
  uint32_t k = (pc >> 16) & 0xFF;
  uint32_t b = pc & 0xFFFF;
  if (k < 0x40) {
    return b >= 0x8000 ? (((0xC0 + k) << 16) | b) : pc;
  }
  if (k >= 0x40 && k < 0x7E) {
    return ((0xC0 + (k - 0x40)) << 16) | b;
  }
  if ((k >= 0x80) && (k < 0xC0)) {
    return b >= 0x8000 ? (((0xC0 + k - 0x80) << 16) | b) : pc;
  }
  return pc;
}

uint32_t pc_to_LoRom(uint32_t pc)
{
  // map addresses to $808000-$FFFFFF
  uint32_t k = (pc >> 16) & 0xFF;
  uint32_t b = pc & 0xFFFF;
  if (k < 0x7E) {
    if (b >= 0x8000) {
      return ((k + 0x80) << 16) | b;
    }
  }
  return pc;
}

uint32_t pc_to_dummy(uint32_t pc)
{
  return pc;
}

uint32_t pc_map(uint32_t pc)
{
  switch (MapMode) {
    case 0: return pc_to_LoRom(pc);
    case 1: return pc_to_HiRom(pc);
    default:
      return pc_to_dummy(pc);
  }
}
