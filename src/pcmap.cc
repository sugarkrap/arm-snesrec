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
  if (k < 0x40 || (k >= 80 && k < 0xC0)) {
    if (p < 0x2000) {
      return 1;
    }
  }
  return 0;
}

uint32_t pc_to_HiRom(uint32_t pc)
{
  // map addresses to $C00000-$FFFFFF
  uint32_t k = (pc >> 16) & 0xFF;
  uint32_t b = pc & 0xFFFF;
  if (k < 0x40) {
    return ((0xC0 + k) << 16) | b;
  }
  if (k >= 0x40 && k < 0x7E) {
    return ((0xC0 + (k - 0x40)) << 16) | b;
  }
  if ((k >= 0x80) && (k < 0xC0)) {
    return ((0xC0 + k - 0x80) << 16) | b;
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
