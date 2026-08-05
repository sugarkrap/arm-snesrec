/*

TITLE SNES Recomp Emulation Layer
AUTHOR Marc-Daniel DALEBA
FILE runtime.cc
DATE 2025-11-14
DESCRIPTION
  This is the emulation layer for the recompiler. The SNES Architecture
  is so far from PC that unfortunately this file is necessary to make
  input handling, rendering and CPU synchronization possible.

*/
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "platform/platform.h"

#include <iostream>

#define SNES_WIDTH  (256)
#define SNES_HEIGHT (224)
/*
 * Cycles per frame, in the units CycleCount actually accumulates.
 *
 * This is NOT the SNES's 89342 master cycles: ADD_CYCLES adds the decoder's
 * per-instruction cycle counts, which are a different unit, so the constant
 * has to be calibrated against observed behaviour rather than copied from the
 * hardware figure.
 *
 * Measured by diffing execution ORDER against the interpreter on FF6: the
 * interpreter left its vblank wait loop every ~12484 instructions, the
 * recompiled binary every ~37450 -- a 3x slow frame, which made the game
 * appear stuck when it was merely running at a third of the pace. 100000/3
 * puts the cadence back in step.
 */
#define NMI_CYCLES  (40000)

/*
 * The frame is split into vblank and the 224 visible lines, in the same
 * proportion the hardware uses (38 blank lines out of 262).
 *
 * The split has to exist for HDMA to work at all. Games build their HDMA
 * tables and write $420C from the NMI handler, and NMI here resets
 * CycleCount to 0 -- so if line 0 began at cycle 0, the frame would be
 * initialised before the handler that sets it up had run, and every channel
 * would look disabled. Reserving the front of the frame for vblank puts
 * hdma_init() after the handler, which is where V=0 sits on hardware.
 */
#define VBLANK_CYCLES (NMI_CYCLES * 38 / 262)
#define ACTIVE_CYCLES (NMI_CYCLES - VBLANK_CYCLES)

int inNMI = 0;
uint8_t regDBR=0;
uint16_t regA=0, regX=0, regY=0, regS=0, regDP=0;
uint8_t N_Flag=0, V_Flag=0, M_Flag=0, X_Flag=0, D_Flag=0;
uint8_t I_Flag=0, Z_Flag=0, C_Flag=0, B_Flag=0, E_Flag=0;
uint8_t MapMode = 0; // 0=LoROM, 1=HiROM, 5=ExHiROM
uint64_t CycleCount = 0;
uint64_t CycleCountNextNMI = NMI_CYCLES;

extern "C" void __CPUSync(void);

extern "C" void __PHP(void);
extern "C" void __PLP(void);
extern "C" void __MVN(uint32_t src, uint32_t dst);
extern "C" void __MVP(uint32_t src, uint32_t dst);

extern "C" void __UpdateNZ_A8(void);
extern "C" void __UpdateNZ_X8(void);
extern "C" void __UpdateNZ_Y8(void);
extern "C" void __UpdateNZ_A16(void);
extern "C" void __UpdateNZ_X16(void);
extern "C" void __UpdateNZ_Y16(void);

extern "C" void __BIT8(uint32_t value);
extern "C" void __BIT16(uint32_t value);
extern "C" uint32_t __TSB(uint32_t value);
extern "C" uint32_t __TRB(uint32_t value);

extern "C" void __TESTNZ8(uint32_t value);
extern "C" void __TESTNZ16(uint32_t value);

extern "C" uint8_t __INC8(uint32_t value);
extern "C" uint16_t __INC16(uint32_t value);
extern "C" uint8_t __ADC8(uint32_t value1, uint32_t value2);
extern "C" uint16_t __ADC16(uint32_t value1, uint32_t value2);
extern "C" uint8_t __SBC8(uint32_t value1, uint32_t value2);
extern "C" uint16_t __SBC16(uint32_t value1, uint32_t value2);

extern "C" uint8_t __ASL8(uint32_t value);
extern "C" uint16_t __ASL16(uint32_t value);
extern "C" uint8_t __LSR8(uint32_t value);
extern "C" uint16_t __LSR16(uint32_t value);
extern "C" uint8_t __ROL8(uint32_t value);
extern "C" uint16_t __ROL16(uint32_t value);
extern "C" uint8_t __ROR8(uint32_t value);
extern "C" uint16_t __ROR16(uint32_t value);

extern "C" void __COMPARE8(uint32_t value1, uint32_t value2);
extern "C" void __COMPARE16(uint32_t value1, uint32_t value2);
extern "C" void __XCE(void);
extern "C" void __WDM(uint8_t v);
extern "C" void __WAI(void);
extern "C" void __WRITE8(uint32_t addr, uint32_t value);
extern "C" void __WRITE16(uint32_t addr, uint32_t value);
extern "C" void __REP(uint32_t mask);
extern "C" void __SEP(uint32_t mask);
extern "C" void __CALL_SHOW(uint32_t addr, uint32_t pc);
extern "C" uint8_t __READ8(uint32_t addr);
extern "C" uint16_t __READ16(uint32_t addr);
extern "C" uint32_t __READ24(uint32_t addr);
extern "C" uint32_t __READ_INS(uint32_t addr);
extern "C" void __PUSH8(uint32_t value);
extern "C" void __PUSH16(uint32_t value);
extern "C" uint8_t __PULL8(void);
extern "C" uint16_t __PULL16(void);
extern "C" void __PRINT_INS(uint32_t pc, uint32_t ins);
extern "C" void __JUMP_FAILED(uint32_t target, uint32_t pc);
extern "C" void __REG_DUMP(void);

extern "C" uint32_t pc_map(uint32_t pc);

#include <snes.h>

extern "C" void Start(void);
extern "C" void Label_Reset(void);
extern "C" void Label_NMI(void);

uint8_t io_RDNMI = 0;
uint8_t io_NMITIMEN = 0;
uint8_t *rom = NULL;
int RecompBreak = 0;
int ROM_OFFSET = 0; // 0 or 512, nothing else
IO io;
PPU ppu;
DMA dma;
/*
 * There is no SPC700. These four ports are all a game sees of it.
 *
 * 0xAA/0xBB is the SPC700 boot ROM's ready signature, which is why a fixed
 * stub gets past the FIRST phase of a handshake. What it cannot do is the
 * second: the IPL protocol has the CPU write a value and spin until the SPC
 * echoes it back, so a constant leaves the game in that spin loop forever --
 * which is exactly where recompiled FF6 sat, on the title screen.
 *
 * Echoing writes back satisfies the echo-wait without emulating anything.
 * This is a stub, not an APU: it gets a game past the handshake, and any
 * routine that depends on the SPC actually doing something will still fail.
 *
 * The echo must NOT be a single array shared by both directions, which is what
 * this was and why FF6 hung. $2140-$2143 are two independent sets of latches:
 * a CPU write goes to the SPC's input registers, a CPU read comes from the
 * SPC's output registers, and a write is not observable by a subsequent read.
 * Collapsing them into one array means a store to $2140 overwrites the ready
 * signature, so FF6's boot check
 *
 *     C50049  LDX #$BBAA
 *     C5004C  LDY #$F0FF
 *     C5004F  STY $2140      ; clobbers the $AA the next line is waiting for
 *     C50052  CPX $2140
 *     C50055  BNE $C5004F
 *
 * could never come out true, and the recompiled binary spun on those three
 * instructions forever. Hence two arrays.
 */
uint8_t apu_in[4]  = { 0xAA, 0xBB, 0x00, 0x00 };  /* APU -> CPU: reads see this */
uint8_t apu_out[4] = { 0x00, 0x00, 0x00, 0x00 };  /* CPU -> APU: writes land here */
int ipl_busy = 0;                                 /* has the $CC kick happened? */
uint8_t ipl_ctr = 0;                              /* next byte counter the IPL expects */
int ipl_handover = 0;                             /* end kick echoed; driver about to start */
int driver_running = 0;                           /* upload finished at least once */
int apu_log_on = 0;                               /* SNESREC_APULOG diagnostic */
/* The VMADDL/VMADDH tracing was left switched on unconditionally while its
 * neighbours were commented out, so every run buried its own output under a
 * VRAM-address flood -- and paid for a printf per PPU address write. Gated
 * rather than deleted: it is the right diagnostic when a screen is wrong. */
int ppu_log_on = 0;                               /* SNESREC_PPULOG diagnostic */
int dma_log_on = 0;                               /* SNESREC_DMALOG diagnostic */
int wram_log_on = 0;                              /* SNESREC_WRAMLOG diagnostic */
/* SNESREC_LAYERS=<hex>: ANDed with TM, so a single BG or OBJ can be viewed on
 * its own. Which layer is painting over the picture is otherwise guesswork. */
int layer_mask = 0x1F;
/* SNESREC_BLOCKMAP: hardware 4-screen tilemap layout; see draw_bg_scanline. */
int blockmap = 0;
/* SNESREC_WATCH=<hex addr>: log every write to a 16-byte window at that guest
 * address, with the PC that did it. A statically recompiled binary can only
 * execute WRAM code if the WRAM bytes match what was traced, so "who was
 * supposed to write this, and did they" is a question that comes up a lot. */
unsigned long watch_addr = 0;
/* SNESREC_DBRAT=<hex pc>: report DBR each time that instruction runs. An
 * absolute address takes its bank from DBR, so when this and the interpreter
 * disagree about an `LDA abs` while holding identical memory, DBR is the
 * thing that differs. */
unsigned long dbr_at = 0, dbr_hits = 0;
/*
 * $2180-$2183: the WRAM port. $2181-$2183 set a 17-bit WRAM address and
 * $2180 reads/writes the byte there, auto-incrementing -- so a game can walk
 * all of WRAM without burning a bank register on it.
 *
 * These were not implemented at all, which meant FF6's WRAM clear
 *
 *     C02976  LDX #$4000
 *     C02979  STZ $2180      <- every one of these went nowhere
 *     C0297C  DEX
 *     ...     BNE
 *
 * silently did nothing. The recompiled binary ran the loop 0x4000 times and
 * WRAM kept its fill byte, so a later `LDA $8000,X` read 0x55 where the
 * interpreter read 0x00 and the two took opposite branches. Invisible to a
 * watchpoint on the store address, because the byte lands at wmadd, not at
 * $2180.
 */
uint32_t wmadd = 0;
unsigned long apu_log_n = 0;

/* Diagnostic: which IO register is the game spinning on? Enabled by
 * SNESREC_IOSTATS, dumped at exit. One array increment per IO read. */
unsigned long io_read_hist[0x10000];
unsigned long nmi_raised = 0;
unsigned long rdnmi_hi = 0;   /* $4210 reads that returned bit7 set */
unsigned long rdnmi_bank[256];  /* which bank are $4210 reads coming from? */
int  pending_bit7 = 0;          /* last $4210 read returned bit7 */
/* r12 (VR_SAVE) holds the guest PC of the instruction currently executing --
 * the per-instruction preamble sets it, and it is callee-saved in both the
 * Win64 and System V ABIs, so it survives into a helper. That lets a helper
 * report WHICH instruction called it without changing the generated code. */
unsigned long bit7_pc[8]; unsigned long bit7_pc_n = 0;

/* Sequential PC log. Render() is called from __CPUSync once per instruction,
 * and r12 still holds that instruction's PC, so this records the execution
 * ORDER -- which the interpreter's trace cannot provide, being deduplicated by
 * pc. Diffing the two orders is what locates a control-flow divergence. */
FILE *pclog = NULL;
unsigned long pclog_left = 0;
unsigned long n_after_bit7_set = 0, n_after_bit7_clear = 0;

/* Ring of the last writes to $4200 (NMITIMEN). The register ends up holding
 * $01 -- NMI disabled -- and the question is whether the game ever enables it
 * and then turns it back off, or never enables it at all. The sequence answers
 * that; a single final value cannot. */
#define NMITIMEN_LOG 32
uint8_t nmitimen_log[NMITIMEN_LOG];
unsigned long nmitimen_writes = 0;
int io_stats_on = 0;
int APUIO0 = 0xAA; // For some SMW tests
int APUIO1 = 0xBB; // 
uint32_t framebuf[SNES_WIDTH * SNES_HEIGHT];
uint16_t input1 = 0;


uint32_t snes_color_to_rgb(uint16_t c)
{
  uint8_t r = (c & 0x1F) << 3;
  uint8_t g = ((c >> 5) & 0x1F) << 3;
  uint8_t b = ((c >> 10) & 0x1F) << 3;
  return (r << 16) | (g << 8) | b;
}

void draw_palette(void);
void draw_sprite_8x8_8bpp(int px, int py, int tile_index, int palindex, int Hflip, int Vflip);
void draw_sprite_8x8_4bpp(int px, int py, int tile_index, int palindex, int Hflip, int Vflip);
void draw_sprite_8x8_2bpp(int px, int py, int tile_index, int palindex, int Hflip, int Vflip);
void draw_vram_2bpp(int offset);
void draw_vram_4bpp(int offset);

void draw_scanline(int y);

bool Running = true;

int main(int argc, char **argv)
{
  FILE *f = fopen(argv[1], "rb");
  // FILE *f = fopen("roms\\eb_noaud.sfc", "rb");
  // FILE *f = fopen("roms\\cputest-basic.sfc", "rb");
  if (!f) {
    printf("error: couldn't open %s\n", argv[1]);
    return -1;
  }
  fseek(f, 0, SEEK_END);
  size_t len = ftell(f);
  fseek(f, 0, SEEK_SET);
  ROM_OFFSET = len % 1024;
  printf("len=%d\n", len);
  printf("ROM_OFFSET=%d\n", ROM_OFFSET);
  if ((ROM_OFFSET != 0) && (ROM_OFFSET != 512)) {
    printf("error: ROM size might be wrong. Check ROM.\n");
    fclose(f);
    return -1;
  }
  
  rom = (uint8_t*)malloc(len);
  fread(rom, 1, len, f);
  fclose(f);

  io_stats_on = getenv("SNESREC_IOSTATS") ? 1 : 0;
  apu_log_on  = getenv("SNESREC_APULOG") ? 1 : 0;
  ppu_log_on  = getenv("SNESREC_PPULOG") ? 1 : 0;
  dma_log_on  = getenv("SNESREC_DMALOG") ? 1 : 0;
  wram_log_on = getenv("SNESREC_WRAMLOG") ? 1 : 0;
  { const char *lm = getenv("SNESREC_LAYERS");
    if (lm && *lm) layer_mask = (int)strtoul(lm, NULL, 16); }
  blockmap = getenv("SNESREC_BLOCKMAP") ? 1 : 0;
  { const char *d = getenv("SNESREC_DBRAT");
    dbr_at = d && *d ? strtoul(d, NULL, 16) : 0; }
  { const char *w = getenv("SNESREC_WATCH");
    watch_addr = w && *w ? strtoul(w, NULL, 16) : 0; }
  { const char *pl = getenv("SNESREC_PCLOG");
    if (pl && *pl) {
      const char *n = getenv("SNESREC_PCLOG_MAX");
      pclog_left = n ? strtoul(n, NULL, 0) : 200000;
      pclog = fopen(pl, "w");
    } }
  if (plat_init("SNES Recomp Runtime") < 0) {
    printf("error: plat_init() failed.\n");
    return -1;
  }
  
  /*
   * WRAM must start at 0x55, not 0x00.
   *
   * A global array is zero-filled by the C runtime, but the trace this binary
   * replays was recorded on snes9x, which does `memset(Memory.RAM, 0x55, ...)`
   * at reset (pocketsnes/snes9x/cpu.cpp). Games read RAM before writing it --
   * FF6 does so at $C3A436:
   *
   *     LDA $1D54     ; never written by anyone; still the fill byte
   *     AND #$40      ; 0x55 & 0x40 = 0x40 -> set,  0x00 & 0x40 -> clear
   *     BEQ +4        ; so the two disagree on the very first pass
   *
   * and took opposite branches, putting the recompiled binary off the traced
   * path at the 418th unique PC. Real hardware leaves RAM indeterminate and a
   * game leaning on it is relying on undefined behaviour, but that is not the
   * bar here: the trace IS this binary's specification, so the fill has to be
   * whatever the tracer used.
   */
  memset(wram, 0x55, WRAM_SIZE);

  // Reset Flags
  X_Flag = 1;
  M_Flag = 1;
  I_Flag = 1;
  E_Flag = 1;
  io_NMITIMEN = 0;
  ppu.BGMODE = 0;
  ppu.vram_addr = 0;
  ppu.STAT77 = 0x00;
  ppu.STAT78 = 0x81;
  ppu.scroll_value = 0;
  
  // Main loop
  Start();
  Label_Reset();
  return 0;
}

void dump_io_stats(void)
{
  int i, shown = 0;
  unsigned long best;
  if (!io_stats_on) return;
  printf("\n=== NMI state ===\n");
  printf("  io_NMITIMEN = $%02X  (bit7 = NMI enabled: %s)\n",
         io_NMITIMEN, (io_NMITIMEN & 0x80) ? "YES" : "NO");
  printf("  NMIs raised  = %lu\n", nmi_raised);
  printf("  $4210 reads returning bit7 SET = %lu\n", rdnmi_hi);
  printf("  after a bit7 read, N set = %lu, N clear = %lu\n",
         n_after_bit7_set, n_after_bit7_clear);
  printf("  bit7 reads seen at PC:");
  { unsigned i; for (i = 0; i < bit7_pc_n; i++) printf(" %06lX", bit7_pc[i]); }
  printf("\n");
  printf("  $4210 reads by BANK:");
  { int b; for (b = 0; b < 256; b++) if (rdnmi_bank[b]) printf(" $%02X=%lu", b, rdnmi_bank[b]); }
  printf("\n");
  printf("  inNMI        = %d\n", inNMI);
  printf("  $4200 writes = %lu, last %d values:", nmitimen_writes,
         (int)(nmitimen_writes < NMITIMEN_LOG ? nmitimen_writes : NMITIMEN_LOG));
  {
    unsigned long n = nmitimen_writes < NMITIMEN_LOG ? nmitimen_writes : NMITIMEN_LOG;
    unsigned long st = nmitimen_writes - n;
    for (unsigned long j = st; j < nmitimen_writes; j++)
      printf(" %02X", nmitimen_log[j % NMITIMEN_LOG]);
    printf("\n");
  }
  printf("\n=== HDMA targets (%lu byte writes) ===\n", hdma_units);
  for (int h = 0; h < 256; ++h)
    if (hdma_target_hist[h])
      printf("  $%04X  %lu\n", 0x2100 + h, hdma_target_hist[h]);
  printf("\n=== IO read histogram (top 12) ===\n");
  while (shown < 12) {
    int bi = -1; best = 0;
    for (i = 0x2100; i < 0x4400; i++)
      if (io_read_hist[i] > best) { best = io_read_hist[i]; bi = i; }
    if (bi < 0) break;
    printf("  $%04X  %lu reads\n", bi, best);
    io_read_hist[bi] = 0;
    shown++;
  }
}

void Cleanup(void)
{
  dump_io_stats();
  plat_shutdown();
  
  FILE *fwram = fopen("wram_dump.x", "wb");
  if (fwram) {
    fwrite(wram, 1, WRAM_SIZE, fwram);
    fclose(fwram);
    printf("DUMPED WRAM in wram_dump.x\n");
  }
  
  FILE *fsram = fopen("sram_dump.x", "wb");
  if (fsram) {
    fwrite(sram, 1, MAX_SRAM_SIZE, fsram);
    fclose(fsram);
    printf("DUMPED SRAM in sram_dump.x\n");
  }
  
  FILE *fvram = fopen("vram_dump.x", "wb");
  if (fvram) {
    fwrite(ppu.vram, 1, 64 * 1024, fvram);
    fclose(fvram);
    printf("DUMPED VRAM in vram_dump.x\n");
  }
  
  FILE *foam = fopen("oam_dump.x", "wb");
  if (foam) {
    fwrite(ppu.oam, 1, 544, foam);
    fclose(foam);
    printf("DUMPED OAM in oam_dump.x\n");
  }
  
  free(rom);
}

void DoMessages(void)
{
  input1 |= plat_poll();
  if (plat_quit_requested()) {
    Cleanup();
    exit(0);
  }
}

int NMI = 0;
static int cur_line = 0;        /* next visible line to render this frame */
static int frame_started = 0;   /* has hdma_init() run for this frame yet */
extern "C" void Render(void)
{
  if (dbr_at) {
    register unsigned long r12v asm("r12");
    if ((r12v & 0xFFFFFF) == dbr_at && dbr_hits++ < 8)
      fprintf(stderr, "REGAT %06lX A=%04X X=%04X Y=%04X S=%04X DP=%04X DBR=%02X\n",
              r12v & 0xFFFFFF, regA, regX, regY, regS, regDP, regDBR);
  }
  if (pclog && pclog_left) {
    register unsigned long r12v asm("r12");
    fprintf(pclog, "%06lX\n", r12v & 0xFFFFFF);
    if (--pclog_left == 0) { fclose(pclog); pclog = NULL; }
  }
  if (NMI)
    return;

  /*
   * Advance the scanline machinery to wherever the CPU has got to. Each line
   * runs its HDMA first and is then rendered with the register state that
   * HDMA just installed -- which is the whole point of doing this per line.
   */
  if (CycleCount >= VBLANK_CYCLES) {
    if (!frame_started) { hdma_init(&dma); frame_started = 1; }
    unsigned long target =
      (unsigned long)((CycleCount - VBLANK_CYCLES) * SNES_HEIGHT / ACTIVE_CYCLES);
    if (target > SNES_HEIGHT) target = SNES_HEIGHT;
    while (cur_line < (int)target) {
      hdma_run_line(&dma);
      draw_scanline(cur_line);
      cur_line++;
    }
  }

  if ((CycleCount >= NMI_CYCLES) || RecompBreak) {
    io.JOY1H = (input1 >> 8) & 0xFF;
    io.JOY1L = input1 & 0xFF;
    input1 = 0;

    /* Finish any lines the cycle estimate did not reach. */
    while (cur_line < SNES_HEIGHT) {
      hdma_run_line(&dma);
      draw_scanline(cur_line);
      cur_line++;
    }
    // draw_vram_4bpp(0xC000);
    // draw_palette();

    plat_present(framebuf, SNES_WIDTH, SNES_HEIGHT);
    DoMessages();

    CycleCount = 0;
    cur_line = 0;
    frame_started = 0;
    NMI = 1;
    nmi_raised++;
  }
}


void __UpdateNZ_A8(void) {
  Z_Flag = ((regA & 0xFF) == 0); N_Flag = (regA & 0x80) != 0;
  if (pending_bit7) { pending_bit7 = 0;
    if (N_Flag) n_after_bit7_set++; else n_after_bit7_clear++; }
}
void __UpdateNZ_X8(void) { Z_Flag = ((regX & 0xFF) == 0); N_Flag = (regX & 0x80) != 0; }
void __UpdateNZ_Y8(void) { Z_Flag = ((regY & 0xFF) == 0); N_Flag = (regY & 0x80) != 0; }

void __UpdateNZ_A16(void) { Z_Flag = (regA == 0); N_Flag = (regA & 0x8000) != 0; }
void __UpdateNZ_X16(void) { Z_Flag = (regX == 0); N_Flag = (regX & 0x8000) != 0; }
void __UpdateNZ_Y16(void) { Z_Flag = (regY == 0); N_Flag = (regY & 0x8000) != 0; }

extern "C" uint8_t __INC8(uint32_t value)
{
  uint8_t v = value & 0xFF;
  v++;
  Z_Flag = ((v & 0xFF) == 0);
  N_Flag = (v & 0x80) != 0;
  return v;
}
extern "C" uint16_t __INC16(uint32_t value)
{
  uint16_t v = value & 0xFFFF;
  v++;
  Z_Flag = (v == 0);
  N_Flag = (v & 0x8000) != 0;
  return v;
}

extern "C" void __BIT8(uint32_t value)
{
  uint8_t A = regA & 0xFF;
  uint8_t v = value & 0xFF;
  
  // printf("__BIT8(value=%02X)\n", value);
  Z_Flag = (A & v) == 0;
  N_Flag = (v & 0x80) != 0;
  V_Flag = (v & 0x40) != 0;
}
extern "C" void __BIT16(uint32_t value)
{
  uint16_t A = regA & 0xFFFF;
  uint16_t v = value & 0xFFFF;
  
  Z_Flag = (A & v) == 0;
  N_Flag = (v & 0x8000) != 0;
  V_Flag = (v & 0x4000) != 0;
}

extern "C" uint32_t __TSB(uint32_t value)
{
  if (M_Flag) {
    uint8_t A = regA & 0xFF;
    uint8_t v = value & 0xFF;
    Z_Flag = (v & A) == 0;
    v |= A;
    return v;
  } else {
    uint16_t A = regA;
    uint16_t v = value & 0xFFFF;
    Z_Flag = (v & A) == 0;
    v |= A;
    return v;
  }
}
extern "C" uint32_t __TRB(uint32_t value)
{
  if (M_Flag) {
    uint8_t A = regA & 0xFF;
    uint8_t v = value & 0xFF;
    Z_Flag = (v & A) == 0;
    v &= ~A;
    return v;
  } else {
    uint16_t A = regA;
    uint16_t v = value & 0xFFFF;
    Z_Flag = (v & A) == 0;
    v &= ~A;
    return v;
  }
}

extern "C" void __TESTNZ8(uint32_t value)
{
  uint8_t v = value & 0xFF;
  Z_Flag = (v == 0);
  N_Flag = (v & 0x80) != 0;
}

extern "C" void __TESTNZ16(uint32_t value)
{
  uint16_t v = value & 0xFFFF;
  Z_Flag = (v == 0);
  N_Flag = (v & 0x8000) != 0;
}

extern "C" void __PHP(void)
{
  uint8_t P = 0;
  P |= N_Flag << 7;
  P |= V_Flag << 6;
  P |= M_Flag << 5;
  P |= X_Flag << 4;
  P |= D_Flag << 3;
  P |= I_Flag << 2;
  P |= Z_Flag << 1;
  P |= C_Flag << 0;
  __PUSH8(P);
}

extern "C" void __PLP(void)
{
  uint8_t P = __PULL8();
  
  N_Flag = (P >> 7) & 1;
  V_Flag = (P >> 6) & 1;
  M_Flag = (P >> 5) & 1;
  X_Flag = (P >> 4) & 1;
  D_Flag = (P >> 3) & 1;
  I_Flag = (P >> 2) & 1;
  Z_Flag = (P >> 1) & 1;
  C_Flag = (P >> 0) & 1;
}

extern "C" void __MVN(uint32_t bankS, uint32_t bankD)
{
  bankS &= 0xFF;
  bankD &= 0xFF;
  regDBR = bankD;
  do {
    CycleCount += 7;
    uint8_t b = __READ8((bankS << 16) | regX);
    __WRITE8((bankD << 16) | regY, b);
    
    regX++;
    regY++;
    if (X_Flag) {
      regX &= 0xFF;
      regY &= 0xFF;
    }
    
    regA--;
  } while (regA != 0xFFFF);
}
extern "C" void __MVP(uint32_t bankS, uint32_t bankD)
{
  bankS &= 0xFF;
  bankD &= 0xFF;
  regDBR = bankD;
  do {
    CycleCount += 7;
    uint8_t b = __READ8((bankS << 16) | regX);
    __WRITE8((bankD << 16) | regY, b);
    
    regX--;
    regY--;
    if (X_Flag) {
      regX &= 0xFF;
      regY &= 0xFF;
    }
    
    regA--;
  } while (regA != 0xFFFF);
}

extern "C" uint8_t __ADC8(uint32_t value1, uint32_t value2)
{
  uint8_t v1 = value1 & 0xFF;
  uint8_t v2 = value2 & 0xFF;

  uint8_t carry = C_Flag ? 1 : 0;
  uint16_t result = 0;
  if (D_Flag) {
    uint16_t res = 0;
    res += (v1 & 0xF) + (v2 & 0xF) + carry;
    if (res >= 0xA) res += 0x6;
    res += (v1 & 0xF0) + (v2 & 0xF0);
    if ((res & 0xF0) >= 0xA0) res += 0x60;
    result = res;
  } else {
    result = (uint16_t)(v1 + v2 + carry);
  }
  
  C_Flag = result > 0xFF;
  Z_Flag = (uint8_t)result == 0;
  N_Flag = (result & 0x80) != 0;
  V_Flag = !((v1 ^ v2) & 0x80) && ((v1 ^ result) & 0x80); // Overflow check
  return (uint8_t)result;
}

extern "C" uint16_t __ADC16(uint32_t value1, uint32_t value2)
{
  uint16_t v1 = value1 & 0xFFFF;
  uint16_t v2 = value2 & 0xFFFF;
  
  uint16_t carry = C_Flag ? 1 : 0;
  uint32_t result = 0;
  if (D_Flag) {
    uint32_t res = 0;
    res += (v1 & 0xF) + (v2 & 0xF) + carry;
    if (res >= 0xA) res += 0x6;
    res += (v1 & 0xF0) + (v2 & 0xF0);
    if ((res & 0xF0) >= 0xA0) res += 0x60;
    res += (v1 & 0xF00) + (v2 & 0xF00);
    if ((res & 0xF00) >= 0xA00) res += 0x600;
    res += (v1 & 0xF000) + (v2 & 0xF000);
    if ((res & 0xF000) >= 0xA000) res += 0x6000;
    result = res;
  } else {
    result = (uint32_t)(v1 + v2 + carry);
  }
  
  C_Flag = result > 0xFFFF;
  Z_Flag = (uint16_t)result == 0;
  N_Flag = (result & 0x8000) != 0;
  V_Flag = !((v1 ^ v2) & 0x8000) && ((v1 ^ result) & 0x8000); // Overflow check
  return (uint16_t)result;
}

extern "C" uint8_t __SBC8(uint32_t value1, uint32_t value2)
{
  uint8_t v1 = value1 & 0xFF;
  uint8_t v2 = (value2 & 0xFF) ^ 0xFF;
  
  uint8_t carry = C_Flag ? 1 : 0;
  int result = 0;
  if (D_Flag) {
    // code from LakeSnes
    result = (v1 & 0xf) + (v2 & 0xf) + carry;
    if(result < 0x10) result = (result - 0x6) & ((result - 0x6 < 0) ? 0xf : 0x1f);
    result = (v1 & 0xf0) + (v2 & 0xf0) + result;
  } else {
    result = v1 + v2 + carry;
  }
  
  V_Flag = (v1 & 0x80) == (v2 & 0x80) && (v2 & 0x80) != (result & 0x80);
  if (D_Flag && result < 0x100) result -= 0x60;
  C_Flag = result >= 0x100;
  Z_Flag = (uint8_t)result == 0;
  N_Flag = (result & 0x80) != 0;
  return (uint8_t)result;
}

extern "C" uint16_t __SBC16(uint32_t value1, uint32_t value2)
{
  uint16_t v1 = value1 & 0xFFFF;
  uint16_t v2 = (value2 & 0xFFFF) ^ 0xFFFF;
  
  uint8_t carry = C_Flag ? 1 : 0;
  int result = 0;
  if (D_Flag) {
    // code from LakeSnes
    result = (v1 & 0xf) + (v2 & 0xf) + carry;
    if(result < 0x10) result = (result - 0x6) & ((result - 0x6 < 0) ? 0xf : 0x1f);
    result = (v1 & 0xf0) + (v2 & 0xf0) + result;
    if(result < 0x100) result = (result - 0x60) & ((result - 0x60 < 0) ? 0xff : 0x1ff);
    result = (v1 & 0xf00) + (v2 & 0xf00) + result;
    if(result < 0x1000) result = (result - 0x600) & ((result - 0x600 < 0) ? 0xfff : 0x1fff);
    result = (v1 & 0xf000) + (v2 & 0xf000) + result;
  } else {
    result = v1 + v2 + carry;
  }
  
  V_Flag = (v1 & 0x8000) == (v2 & 0x8000) && (v2 & 0x8000) != (result & 0x8000);
  if (D_Flag && (result < 0x10000)) result -= 0x6000;
  C_Flag = result >= 0x10000;
  Z_Flag = (uint16_t)result == 0;
  N_Flag = (result & 0x8000) != 0;
  return (uint16_t)result;
}

extern "C" uint8_t __ASL8(uint32_t value)
{
  uint8_t v = value & 0xFF;
  uint8_t result = v << 1;
  
  C_Flag = (v & 0x80) != 0;
  Z_Flag = (result == 0);
  N_Flag = (result & 0x80) != 0;
  return result;
}

extern "C" uint16_t __ASL16(uint32_t value)
{
  uint16_t v = value & 0xFFFF;
  uint16_t result = v << 1;
  
  C_Flag = (v & 0x8000) != 0;
  Z_Flag = (result == 0);
  N_Flag = (result & 0x8000) != 0;
  return result;
}

extern "C" uint8_t __LSR8(uint32_t value)
{
  uint8_t v = value & 0xFF;
  uint8_t result = v >> 1;
  
  C_Flag = v & 1;
  Z_Flag = (result == 0);
  N_Flag = (result & 0x80) != 0;
  return result;
}

extern "C" uint16_t __LSR16(uint32_t value)
{
  uint16_t v = value & 0xFFFF;
  uint16_t result = v >> 1;
  
  C_Flag = v & 1;
  Z_Flag = (result == 0);
  N_Flag = (result & 0x8000) != 0;
  return result;
}

extern "C" uint8_t __ROL8(uint32_t value)
{
  uint8_t v = value & 0xFF;
  int c = (v & 0x80) != 0;
  uint16_t result = v << 1;
  
  if (C_Flag) { result |= 1; }
  C_Flag = c;
  Z_Flag = (uint8_t)result == 0;
  N_Flag = (result & 0x80) != 0;
  return (uint8_t)result;
}
extern "C" uint16_t __ROL16(uint32_t value)
{
  uint16_t v = value & 0xFFFF;
  int c = (v & 0x8000) != 0;
  uint32_t result = v << 1;
  
  if (C_Flag) { result |= 1; }
  C_Flag = c;
  Z_Flag = (uint16_t)result == 0;
  N_Flag = (result & 0x8000) != 0;
  return (uint16_t)result;
}

extern "C" uint8_t __ROR8(uint32_t value)
{
  uint8_t v = value & 0xFF;
  int c = value & 1;
  uint16_t result = v >> 1;
  
  if (C_Flag) { result |= 0x80; }
  C_Flag = c;
  Z_Flag = (uint8_t)result == 0;
  N_Flag = (result & 0x80) != 0;
  return (uint8_t)result;
}
extern "C" uint16_t __ROR16(uint32_t value)
{
  uint16_t v = value & 0xFFFF;
  int c = v & 1;
  uint32_t result = v >> 1;
  
  if (C_Flag) { result |= 0x8000; }
  C_Flag = c;
  Z_Flag = (uint16_t)result == 0;
  N_Flag = (result & 0x8000) != 0;
  return (uint16_t)result;
}

uint8_t read8_wram_LoROM(uint64_t addr, int *read);
uint8_t read8_wram_HiROM(uint64_t addr, int *read);

uint8_t read8_wram(uint64_t addr, int *read)
{
  *read = 0;
  switch (MapMode) {
    case 0: return read8_wram_LoROM(addr, read);
    case 1: return read8_wram_HiROM(addr, read);
    default:
      *read = 0;
  }
  return 0;
}

uint8_t read8_wram_LoROM(uint64_t addr, int *read)
{
  uint8_t bank = (addr & 0xFF0000) >> 16;
  uint16_t offset = addr & 0xFFFF;
  uint32_t address = addr & 0xFFFFFF;
  
  if (((bank >= 0x00 && bank < 0x40) ||
      (bank >= 0x80 && bank <= 0xC0)) &&
      offset < 0x2000) {
    // Lo RAM
    *read = 1;
    return wram[offset];
  } else
  if ((bank == 0x7E) || (bank == 0x7F)) {
    // WRAM
    *read = 1;
    return wram[((bank - 0x7E) << 16) | offset];
  } else
  if ((bank >= 0x70) && (bank < 0x7E) && (offset < 0x8000)) {
    // SRAM
    *read = 1;
    return sram[offset];
  }
  return 0;
}

uint8_t read8_wram_HiROM(uint64_t addr, int *read)
{
  uint8_t bank = (addr & 0xFF0000) >> 16;
  uint16_t offset = addr & 0xFFFF;
  uint32_t address = (addr & 0xFFFFFF);
  
  *read = 0;
  if (((bank < 0x40) || (bank >= 0x80 && bank <= 0xC0))
      && offset < 0x2000) { // Lo RAM
    // printf("__READ8(addr=%04X)\n", address);
    *read = 1;
    return wram[offset];
  } else
  if ((bank == 0x7E) || (bank == 0x7F)) {
    // WRAM
    *read = 1;
    return wram[((bank - 0x7E) << 16) | offset];
  } else
  if ((bank >= 0x30) && (bank < 0x40) && (offset >= 0x6000) && (offset < 0x8000)) {
    // SRAM
    *read = 1;
    return sram[offset - 0x6000];
  }
  return 0;
}

uint8_t read8_rom_LoROM(uint64_t addr, int* read);
uint8_t read8_rom_HiROM(uint64_t addr, int* read);

static uint8_t read8_rom(uint64_t addr, int* read)
{
  switch (MapMode) {
    case 0: return read8_rom_LoROM(addr, read);
    case 1: return read8_rom_HiROM(addr, read);
    default:
      *read = 0;
  }
  return 0;
}

uint8_t read8_rom_LoROM(uint64_t addr, int* read)
{
  uint8_t bank = (addr & 0xFF0000) >> 16;
  uint16_t offset = addr & 0xFFFF;
  uint32_t address = (addr & 0xFFFFFF);
  
  if (((bank >= 0x00 && bank < 0x7E) || (bank >= 0x80 && bank <= 0xFF)) &
      (address & 0xFFFF) >= 0x8000) {
    // ROM
    *read = 1;
    uint8_t ret = rom[(address - 0x8000) + ROM_OFFSET];
    return ret;
  }
  return 0;
}

uint8_t read8_rom_HiROM(uint64_t addr, int* read)
{
  uint8_t bank = (addr & 0xFF0000) >> 16;
  uint16_t offset = addr & 0xFFFF;
  uint32_t rom_offset = 0;
  
  *read = 0;
  if (bank < 0x40) {
    // ROM
    if (offset >= 0x8000) {
      *read = 1;
      rom_offset = (bank * 0x10000) + offset;
      return rom[rom_offset % 0x400000];
    }
    return 0;
  } else
  if (bank >= 0x40 && bank < 0x7E) {
    // ROM
    *read = 1;
    rom_offset = (bank * 0x10000) + offset;
    return rom[rom_offset % 0x400000];
  } else
  if (bank >= 0x80 && bank < 0xC0) {
    // ROM
    if (offset >= 0x8000) {
      *read = 1;
      rom_offset = ((bank - 0x80) * 0x10000) + offset;
      return rom[rom_offset % 0x400000];
    }
    return 0;
  } else
  if (bank >= 0xC0 && bank <= 0xFF) {
    // ROM
    *read = 1;
    rom_offset = ((bank - 0xC0) * 0x10000) + offset;
    return rom[rom_offset % 0x400000];
  }
  return 0;
}

extern "C" uint8_t __READ8(uint32_t addr)
{
  if (io_stats_on) {
    uint16_t off = addr & 0xFFFF;
    if (off >= 0x2100 && off < 0x4400)
      io_read_hist[off]++;
    if (off == 0x4210)
      rdnmi_bank[(addr >> 16) & 0xFF]++;
  }
  uint8_t bank = (addr & 0xFF0000) >> 16;
  uint16_t offset = addr & 0xFFFF;
  uint32_t address = addr & 0xFFFFFF;
  
  // printf("__READ8(addr=%04X)\n", addr);
  if (addr == 0x213E /* STAT77 */) {
    return ppu.STAT77;
  } else
  if (addr == 0x213F /* STAT78 */) {
    return ppu.STAT78;
  } else
  if (addr == 0x2180 /* WMDATA */) {
    uint8_t v = wram[wmadd & 0x1FFFF];
    wmadd = (wmadd + 1) & 0x1FFFF;
    return v;
  }
  if (addr >= 0x2140 && addr <= 0x2143 /* APUIO0-3 */) {
    return apu_in[addr - 0x2140];
  } else
  if (addr == 0x4214 /* RDDIVL */) {
    return io.RDDIVL;
  } else
  if (addr == 0x4215 /* RDDIVH */) {
    return io.RDDIVH;
  } else
  if (addr == 0x4216 /* RDMPYL */) {
    return io.RDMPYL;
  } else
  if (addr == 0x4217 /* RDMPYH */) {
    return io.RDMPYH;
  } else
  if (addr == 0x4210 /* RDNMI */) {
    uint8_t rdnmi = io_RDNMI;
    if (io_stats_on && (rdnmi & 0x80)) {
      rdnmi_hi++; pending_bit7 = 1;
      { register unsigned long r12v asm("r12");
        unsigned long pc = r12v & 0xFFFFFF; unsigned i; int seen = 0;
        for (i = 0; i < bit7_pc_n; i++) if (bit7_pc[i] == pc) seen = 1;
        if (!seen && bit7_pc_n < 8) bit7_pc[bit7_pc_n++] = pc; }
    }
    io_RDNMI &= 0x7F;
    return rdnmi;
  } else
  if (addr == 0x4212 /* HVBJOY */) {
    return io.HVBJOY;
  } else
  if (addr == 0x4219 /* JOY1H */) {
    return io.JOY1H;
  } else
  if (addr == 0x4218 /* JOY1L */) {
    return io.JOY1L;
  }
  
  int read = 0;
  uint8_t value = read8_rom(addr, &read);
  if (read) {
    return value;
  }
  
  value = read8_wram(addr, &read);
  if (read) {
    return value;
  }
  return 0;
}

extern "C" uint16_t __READ16(uint32_t addr)
{
  uint32_t address = addr & 0xFFFFFF;
  uint16_t ret = 0;
  
  ret |= (__READ8(addr+1) & 0xFF) << 8;
  ret |= __READ8(addr) & 0xFF;
  return ret;
}

extern "C" uint32_t __READ24(uint32_t addr)
{
  uint32_t address = addr & 0xFFFFFF;
  uint32_t ret = 0;
  
  ret |= (__READ8(addr+2) & 0xFF) << 16;
  ret |= (__READ8(addr+1) & 0xFF) << 8;
  ret |= __READ8(addr) & 0xFF;
  // printf("__READ24(addr=%06X)=%06X\n", addr, ret);
  return ret;
}

extern "C" uint32_t __READ_INS(uint32_t addr)
{
  uint32_t address = addr & 0xFFFFFF;
  uint32_t ret = 0;
  
  ret |= (__READ8(addr) & 0xFF) << 24;
  ret |= (__READ8(addr+1) & 0xFF) << 16;
  ret |= (__READ8(addr+2) & 0xFF) << 8;
  ret |= __READ8(addr+3) & 0xFF;
  // printf("__READ_INS(%06X)=%08X\n", addr, ret);
  return ret;
}

/*
 * A WRAM instruction whose bytes no longer match the trace has no valid
 * statically compiled form, so the generated block guards itself and skips.
 * That skip used to be a plain fall-through into the next emitted block --
 * which is not a fallback at all, because "next emitted block" is whatever
 * the recompiler happened to lay down next, ordered by first encounter in the
 * trace and so unrelated to the guest's control flow.
 *
 * FF6 made that catastrophic. Its NMI vector is `JML $001500`, and a routine
 * at $7E505F rewrites $001500/$001504 into JML trampolines every time it runs
 * -- that is the entire point of putting them in RAM. So from the first frame
 * onwards both guards failed, and every NMI fell through both blocks into
 * Label_7E5000, some 700 trace rows further down, entering an unrelated
 * routine with an NMI stack frame. It ran to an RTS that pulled bytes the
 * trampoline installer had just written ($5C, $7E) and jumped to $7E5C7F,
 * which is not code at all. Nothing was logged along the way, because a
 * skipped block emits no __CPUSync.
 *
 * Self-modified WRAM code is overwhelmingly this one idiom: a re-targetable
 * jump vector. So decode the live bytes for the jump family and dispatch on
 * the address actually stored there. Anything else returns 0 for "no
 * retarget" and keeps the historical fall-through -- still wrong, but no more
 * wrong than it was, and SNESREC_WRAMLOG now names every place it happens
 * instead of letting it corrupt the run in silence.
 */
extern "C" uint32_t __WRAM_RETARGET(uint32_t pc)
{
  uint32_t ins = __READ_INS(pc);
  uint8_t  op  = (ins >> 24) & 0xFF;
  uint32_t a0  = (ins >> 16) & 0xFF;
  uint32_t a1  = (ins >>  8) & 0xFF;
  uint32_t a2  =  ins        & 0xFF;
  uint32_t target = 0;

  switch (op) {
    case 0x5C:                                  /* JML addr24              */
      target = (a2 << 16) | (a1 << 8) | a0;
      break;
    case 0x4C:                                  /* JMP addr16, program bank */
      target = (pc & 0xFF0000) | (a1 << 8) | a0;
      break;
    case 0x6C: {                                /* JMP (addr16), bank $00   */
      uint32_t p = (a1 << 8) | a0;
      target = (pc & 0xFF0000)
             | ((__READ8(p + 1) & 0xFF) << 8)
             |  (__READ8(p)     & 0xFF);
      break;
    }
    default:
      break;
  }

  if (wram_log_on)
    printf("WRAM PATCHED %06X: %08X -> %s %06X\n", pc, ins,
           target ? "retarget" : "fall through", target);
  return target;
}

int write8_sram_HiROM(uint64_t addr, uint8_t value)
{
  uint8_t bank = (addr & 0xFF0000) >> 16;
  uint16_t offset = addr & 0xFFFF;

  if (offset >= 0x6000 && offset < 0x8000) {
    if (bank >= 0x20 && bank < 0x40) {
      sram[offset - 0x6000] = value;
      return 1;
    } else
    if (bank >= 0xA0 && bank < 0xC0) {
      sram[offset - 0x6000] = value;
      return 1;
    }
    return 0;
  }
  return 0;
}

extern "C" void __WRITE8(uint32_t addr, uint32_t value)
{
  uint8_t v = value & 0xFF;
  uint8_t bank = (addr & 0xFF0000) >> 16;
  uint16_t offset = addr & 0xFFFF;

  if (watch_addr && (addr & 0xFFFFFF) >= watch_addr &&
                    (addr & 0xFFFFFF) <  watch_addr + 16) {
    register unsigned long r12v asm("r12");
    fprintf(stderr, "WATCH %06X <- %02X (pc=%06lX)\n",
            addr & 0xFFFFFF, v, r12v & 0xFFFFFF);
  }

  // if (offset == 0x210D)
    // printf("__WRITE8(addr=0x%06X, value=0x%02X)\n", addr, v);
  
  if (offset >= 0x2180 && offset <= 0x2183) {
    switch (offset) {
      case 0x2180:
        wram[wmadd & 0x1FFFF] = v;
        wmadd = (wmadd + 1) & 0x1FFFF;
        break;
      case 0x2181: wmadd = (wmadd & 0x1FF00) | v;              break;
      case 0x2182: wmadd = (wmadd & 0x100FF) | ((uint32_t)v << 8);  break;
      case 0x2183: wmadd = (wmadd & 0x0FFFF) | ((uint32_t)(v & 1) << 16); break;
    }
    return;
  }

  /* APU ports: writes land in the CPU->APU latch, which is NOT the latch reads
   * come from. See apu_in's definition. */
  if (offset >= 0x2140 && offset <= 0x2143) {
    apu_out[offset - 0x2140] = v;
    if (apu_log_on && apu_log_n < 400000)
      fprintf(stderr, "APUW %04X <- %02X  (pc=%06lX)\n", offset, v,
              ({ register unsigned long r12v asm("r12"); r12v & 0xFFFFFF; })), apu_log_n++;
    /* The IPL upload protocol, as observed on the port traffic rather than
     * assumed:
     *
     *   $2142/$2143 <- target address
     *   $2141 <- non-zero, $2140 <- $CC        begin transfer
     *   $2141 <- data,     $2140 <- counter    one byte; counter 00,01,02...
     *   $2141 <- 0,        $2140 <- <not next> end: run the uploaded driver
     *
     * The end kick is distinguishable only by the counter not following on --
     * FF6 ends its upload with $2140 <- $13 where $10 would come next -- which
     * is why the counter is tracked instead of echoing blindly. Checking
     * $2141 only on that mismatch is what keeps a legitimate $00 DATA byte
     * from being read as end-of-transfer.
     *
     * Once the driver is running it re-publishes the ready signature, so the
     * game can call this whole routine again, and does: leaving ipl_busy
     * latched forever put FF6 straight back into the $BBAA spin one scene
     * later. */
    if (offset == 0x2140) {
      if (!ipl_busy) {
        /* Deferred handover: the ready signature can only come back AFTER the
         * game has seen the end kick's echo, because it spins on that echo at
         * $C500EA before moving on. Publishing $AA/$BB at end-of-transfer
         * instead of here overwrote the $13 it was waiting for and hung it
         * there -- one stall EARLIER than the one being fixed. */
        if (ipl_handover) { ipl_handover = 0; apu_in[0] = 0xAA; apu_in[1] = 0xBB; }
        if (v == 0xCC) { ipl_busy = 1; ipl_ctr = 0; apu_in[0] = 0xCC; }
        else if (driver_running) {
          /* Command acknowledgement. Once the uploaded driver is running,
           * FF6 talks to it by writing a command byte to $2140 (with params
           * in $2141/$2142) and spinning until $2140 reads that byte back:
           *
           *     C501B0  LDA $00 / STA $2140
           *     C501B5  CMP $2140
           *     C501B8  BNE $C501B5
           *
           * so the ack IS the echo. There is no SPC700 here to act on the
           * command, and nothing yet needs one to -- the game only waits for
           * receipt. Sound will be silent; the game proceeds. */
          apu_in[0] = v;
        }
        /* anything else: ignored, so the ready signature stays readable */
      } else if (v == ipl_ctr) {
        apu_in[0] = v; ipl_ctr++;              /* byte accepted */
      } else if (apu_out[1] == 0) {
        apu_in[0] = v;                         /* the end kick is echoed too */
        ipl_busy = 0; ipl_handover = 1;        /* driver starts running */
        driver_running = 1;
      } else {
        ipl_ctr = 0; apu_in[0] = v;            /* a further block follows */
      }
    }
    return;
  }

  if (write8_sram_HiROM(addr, v)) {
    return;
  } else
  if (((bank < 0x40) || (bank >= 0x80 && bank < 0xC0)) && offset < 0x2000) {
    // Low RAM
    wram[offset] = v;
  } else
  if ((bank == 0x7E) || (bank == 0x7F)) {
    // WRAM
    wram[((bank - 0x7E) << 16) | offset] = v;
    return;
  }
  // ------------ MMIO Registers -----------
  if (addr == 0x4200 /* NMITIMEN */) {
    if (io_stats_on) {
      nmitimen_log[nmitimen_writes % NMITIMEN_LOG] = v;
      nmitimen_writes++;
    }
    io_NMITIMEN = v;
    // printf("WROTE %02X TO NMITIMEN\n", v);
  } else
  if (addr == 0x4202 /* WRMPYA */) {
    io.WRMPYA = v;
  } else
  if (addr == 0x4203 /* WRMPYB */) {
    io.WRMPYB = v;
    multiply_5A22(&io);
  } else
  if (addr == 0x4204 /* WRDIVL */) {
    io.WRDIVL = v;
  } else
  if (addr == 0x4205 /* WRDIVH */) {
    io.WRDIVH = v;
  } else
  if (addr == 0x4206 /* WRDIVB */) {
    io.WRDIVB = v;
    divide_5A22(&io);
  } else // ------------ PPU Registers ------------
  if (addr == 0x2100 /* INIDISP */) {
    ppu.INIDISP = v;
  } else
  if (addr == 0x2121 /* CGADD */) {
    // printf("WRITE8(%02X) to CGADD\n", v);
    ppu.CGADD = v * 2;
  } else
  if (addr == 0x2122 /* CGDATA */) {
    write_cgram(&ppu, value);
    // printf("WRITE8(%02X) to CGDATA\n", value & 0xFF);
  } else
  if (addr == 0x2105 /* BGMODE */) {
    ppu.BGMODE = v;
  } else
  if (addr == 0x2107 /* BG1SC */) {
    ppu.BG1SC = v;
  } else
  if (addr == 0x2108 /* BG2SC */) {
    ppu.BG2SC = v;
  } else
  if (addr == 0x2109 /* BG3SC */) {
    ppu.BG3SC = v;
  } else
  if (addr == 0x210B /* BG12NBA */) {
    ppu.BG12NBA = v;
  } else
  if (addr == 0x210C /* BG34NBA */) {
    ppu.BG34NBA = v;
  } else
  if (addr == 0x210D /* BG1HOFS */) {
    if (ppu.scroll_value) {
      ppu.BG1HOFS = ((v & 3) << 8) | (ppu.BG1HOFS & 0xFF);
    } else {
      ppu.BG1HOFS = (ppu.BG1HOFS & 0xFF00) | v;
    }
    ppu.scroll_value ^= 1;
  } else
  if (addr == 0x210E /* BG1VOFS */) {
    if (ppu.scroll_value) {
      ppu.BG1VOFS = ((v & 3) << 8) | (ppu.BG1VOFS & 0xFF);
    } else {
      ppu.BG1VOFS = (ppu.BG1VOFS & 0xFF00) | v;
    }
    ppu.scroll_value ^= 1;
  } else
  if (addr == 0x210F /* BG2HOFS */) {
    if (ppu.scroll_value) {
      ppu.BG2HOFS = ((v & 3) << 8) | (ppu.BG2HOFS & 0xFF);
    } else {
      ppu.BG2HOFS = (ppu.BG2HOFS & 0xFF00) | v;
    }
    ppu.scroll_value ^= 1;
  } else
  if (addr == 0x2110 /* BG2VOFS */) {
    if (ppu.scroll_value) {
      ppu.BG2VOFS = ((v & 3) << 8) | (ppu.BG2VOFS & 0xFF);
    } else {
      ppu.BG2VOFS = (ppu.BG2VOFS & 0xFF00) | v;
    }
    ppu.scroll_value ^= 1;
  } else
  if (addr == 0x2111 /* BG3HOFS */) {
    ppu.BG3HOFS = v;
    ppu.scroll_value ^= 1;
  } else
  if (addr == 0x2112 /* BG3VOFS */) {
    ppu.BG3VOFS = v;
    ppu.scroll_value ^= 1;
  } else
  if (addr == 0x2113 /* BG4HOFS */) {
    ppu.BG4HOFS = v;
    ppu.scroll_value ^= 1;
  } else
  if (addr == 0x2114 /* BG4VOFS */) {
    ppu.BG4VOFS = v;
    ppu.scroll_value ^= 1;
  } else
  if (addr == 0x2101 /* OBJSEL */) {
    ppu.OBJSEL = v;
    // printf("ppu.OBJSEL=%02X\n", v);
  } else
  if (addr == 0x2102 /* OAMADDL */) {
    ppu.OAMADDL = v;
  } else
  if (addr == 0x2103 /* OAMADDH */) {
    ppu.OAMADDH = v;
  } else
  if (addr == 0x2104 /* OAMDATA */) {
    write_oam(&ppu, v);
  } else
  if (addr == 0x2115 /* VMAIN */) {
    ppu.VMAIN = v;
  } else
  if (addr == 0x2116 /* VMADDL */) {
    if (ppu_log_on) printf("WRITE8(%02X) to VMADDL\n", v);
    ppu.VMADDL = v;
    ppu.vram_addr = (ppu.VMADDH << 8) | ppu.VMADDL;
    ppu.vram_addr &= 0x7FFF;
    ppu.vram_addr *= 2;
    // printf("ppu.vram_addr=%04X\n", ppu.vram_addr);
  } else
  if (addr == 0x2117 /* VMADDH */) {
    if (ppu_log_on) printf("WRITE8(%02X) to VMADDH\n", v);
    ppu.VMADDH = v;
    ppu.vram_addr = (ppu.VMADDH << 8) | ppu.VMADDL;
    ppu.vram_addr &= 0x7FFF;
    ppu.vram_addr *= 2;
    // printf("ppu.vram_addr=%04X\n", ppu.vram_addr);
  } else
  if (addr == 0x212C /* TM */) {
    ppu.TM = v;
  } else
  if (addr == 0x2118 /* VMDATAL */) {
    // printf("WRITE8(%02X) to VMDATAL\n", v);
    write_vram(&ppu, v, 0, (ppu.VMAIN & 0x80) == 0);
  } else
  if (addr == 0x2119 /* VMDATAH */) {
    // printf("WRITE8(%02X) to VMDATAH\n", v);
    write_vram(&ppu, v, 1, (ppu.VMAIN & 0x80) != 0);
  }
  /* SNESREC_DMALOG: DMA register traffic. Answers "is DMA even running, and
   * what B-bus target is it aiming at" -- which is how the WRAM routine at
   * $7E5000 was shown NOT to arrive by DMA (no channel ever targets $2180). */
  if (dma_log_on && (addr == 0x420B || addr == 0x420C ||
                     (addr >= 0x4300 && addr <= 0x437F)))
    fprintf(stderr, "DMAW %06X <- %02X\n", addr, v);
  write_dma(&dma, addr, v);
}

extern "C" void __WRITE16(uint32_t addr, uint32_t value)
{
  // printf("__WRITE16(addr=0x%04X, value=0x%04X)\n", addr, value);
  __WRITE8(addr, value & 0xFF);
  __WRITE8(addr + 1, (value >> 8) & 0xFF);
}

extern "C" void __REP(uint32_t mask)
{
  if (mask & 0x01) C_Flag = 0;
  if (mask & 0x02) Z_Flag = 0;
  if (mask & 0x04) I_Flag = 0;
  if (mask & 0x08) D_Flag = 0;
  if (!E_Flag) {
    if (mask & 0x10) X_Flag = 0;
    if (mask & 0x20) M_Flag = 0;
  }
  if (mask & 0x40) V_Flag = 0;
  if (mask & 0x80) N_Flag = 0;
}

extern "C" void __SEP(uint32_t mask)
{
  // printf("__SEP(mask=%02X)\n", mask);
  if (mask & 0x01) C_Flag = 1;
  if (mask & 0x02) Z_Flag = 1;
  if (mask & 0x04) I_Flag = 1;
  if (mask & 0x08) D_Flag = 1;
  if (!E_Flag) {
    if (mask & 0x10) X_Flag = 1;
    if (mask & 0x20) M_Flag = 1;
  }
  if (mask & 0x40) V_Flag = 1;
  if (mask & 0x80) N_Flag = 1;
  if (X_Flag) {
    regY &= 0xFF;
    regX &= 0xFF;
  }
}

extern "C" void __REG_DUMP(void)
{
  uint8_t P = 0;
  P |= N_Flag << 7;
  P |= V_Flag << 6;
  P |= M_Flag << 5;
  P |= X_Flag << 4;
  P |= D_Flag << 3;
  P |= I_Flag << 2;
  P |= Z_Flag << 1;
  P |= C_Flag << 0;
  
  printf("              __REG_DUMP\n");
  printf("regA  =%04X regX=%04X regY=%04X\n", regA, regX, regY);
  printf("regS  =%04X\n", regS);
  printf("regDP =%04X\n", regDP);
  printf("regDBR=%02X\n", regDBR);
  printf("P     =%02X\n", P);
  printf("CycleCount=%d\n", CycleCount);
  printf("\n             STACK DUMP\n");
  for (int i = 0; i < 48; ++i) {
    int c = wram[regS + i + 1];
    printf("%02X ", c);
    if ((i + 1) % 16 == 0) {
      printf("\n");
    }
  }
  printf("\n");
  // RecompBreak = 1;
  // for (;;)
    // ;
}

extern "C" void __PUSH8(uint32_t value)
{
  uint8_t v = value & 0xFF;
  __WRITE8(regS--, v);
}

extern "C" void __PUSH16(uint32_t value)
{
  uint16_t v = value & 0xFFFF;
  __PUSH8(v >> 8);
  __PUSH8(v);
}

extern "C" uint8_t __PULL8(void)
{
  regS++;
  uint8_t ret = __READ8(regS);
  // printf("__PULL8()=%02X\n", ret);
  
  // N_Flag = (ret & 0x80) != 0;
  // Z_Flag = (ret == 0);
  return ret;
}

extern "C" uint16_t __PULL16(void)
{
  uint16_t ret = 0;
  ret |= __READ8(++regS);
  ret |= __READ8(++regS) << 8;
  // printf("__PULL16()=%04X\n", ret);
  
  // N_Flag = (ret & 0x8000) != 0;
  // Z_Flag = (ret == 0);
  return ret;
}

extern "C" void __PRINT_INS(uint32_t pc, uint32_t ins)
{
  printf("\nUNKNOWN INSTRUCTION %08X AT %06X\n\n", ins, pc);
  __REG_DUMP();
}

extern "C" void __JUMP_FAILED(uint32_t target, uint32_t pc)
{
  printf("\nFAILED TO JUMP TO ADDRESS %06X AT %06X\n\n", target, pc);
  __REG_DUMP();
  Cleanup();
  exit(0);
}

extern "C" void __CALL_SHOW(uint32_t addr, uint32_t pc)
{
  // printf("__CALL_ADDRESS(addr=%06X) FROM %06X\n", addr, pc);
}

extern "C" void __WAI(void)
{
  // stub
}

extern "C" void __COMPARE8(uint32_t value1, uint32_t value2)
{
  uint8_t v1 = value1 & 0xFF;
  uint8_t v2 = value2 & 0xFF;
  uint8_t result = v1 - v2;
  // printf("__COMPARE8(value1=%04X, value2=%04X)\n", value1, value2);
  
  Z_Flag = (result == 0);
  C_Flag = (v1 >= v2);
  N_Flag = (result & 0x80) != 0;
}

extern "C" void __COMPARE16(uint32_t value1, uint32_t value2)
{
  uint16_t v1 = value1 & 0xFFFF;
  uint16_t v2 = value2 & 0xFFFF;
  uint16_t result = v1 - v2;
  
  // printf("__COMPARE16(value1=%04X, value2=%04X)\n", value1, value2);
  
  Z_Flag = (result == 0);
  C_Flag = (v1 >= v2);
  N_Flag = (result & 0x8000) != 0;
}

extern "C" void __XCE(void)
{
  uint8_t tmp_Flag = C_Flag;
  C_Flag = E_Flag;
  E_Flag = tmp_Flag;
  if (E_Flag) {
    M_Flag = 1;
    X_Flag = 1;
    regX &= 0xFF;
    regY &= 0xFF;
    regS = 0x100 | (regS & 0xFF);
  }
}

extern "C" void __WDM(uint8_t v)
{
  // printf("__WDM()\n");
}

void draw_palette(void)
{
  for (int i = 0; i < 256; ++i) {
    int idx = i * 2;
    uint32_t color = snes_color_to_rgb(ppu.cgram[idx]+ppu.cgram[idx+1]*256);
    framebuf[(i % 16) + SNES_WIDTH * (i / 16)] = color;
  }
}

void draw_sprite_8x8_8bpp(int px, int py, int tile_index, int palindex, int Hflip, int Vflip)
{
  int tile = tile_index;
  
  palindex *= 256;
  for (int y = 0; y < 8; ++y) {
    uint8_t p0 = ppu.vram[tile + y*2 + 0];
    uint8_t p1 = ppu.vram[tile + y*2 + 1];
    uint8_t p2 = ppu.vram[tile + 16 + y*2 + 0];
    uint8_t p3 = ppu.vram[tile + 16 + y*2 + 1];
    uint8_t p4 = ppu.vram[tile + 32 + y*2 + 0];
    uint8_t p5 = ppu.vram[tile + 32 + y*2 + 1];
    uint8_t p6 = ppu.vram[tile + 48 + y*2 + 0];
    uint8_t p7 = ppu.vram[tile + 48 + y*2 + 1];
    int dy = py + y;
    if (Vflip) {
      dy = py + (7 - y);
    }
    
    if ((dy < 0) || dy >= SNES_HEIGHT) continue;
    for (int x = 0; x < 8; x++) {
      int dx = px + x;
      if ((dx < 0) || dx >= SNES_WIDTH) continue;
      
      int bit = Hflip ? x : (7 - x);
      uint8_t pindex =
        ((p0 >> bit) & 1) |
        (((p1 >> bit) & 1) << 1) |
        (((p2 >> bit) & 1) << 2) |
        (((p3 >> bit) & 1) << 3) |
        (((p4 >> bit) & 1) << 4) |
        (((p5 >> bit) & 1) << 5) |
        (((p6 >> bit) & 1) << 6) |
        (((p7 >> bit) & 1) << 7);
      
      uint16_t color16_0 = ppu.cgram[palindex + 2 * pindex];
      uint16_t color16_1 = ppu.cgram[palindex + 2 * pindex + 1];
      uint32_t color32 = snes_color_to_rgb(color16_0+color16_1*256);
      if (pindex != 0) {
        framebuf[dx + SNES_WIDTH * dy] = color32;
      }
    }
  }
}

uint8_t dump_palette[] = {
  // Some funky SNES Palette
  0x00, 0x00, 
  0x08, 0x08, 
  0x10, 0x10, 
  0x18, 0x18, 
  0x20, 0x20, 
  0x28, 0x28, 
  0x30, 0x30, 
  0x38, 0x38, 
  0x3F, 0x3F, 
  0x47, 0x47, 
  0x4F, 0x4F, 
  0x57, 0x57,
  0x5F, 0x5F,
  0x67, 0x67,
  0x6F, 0x6F,
  0x7F, 0x7F
};

void draw_sprite_8x8_4bpp(int px, int py, int tile_index, int palindex, int Hflip, int Vflip)
{
  int tile = tile_index;
  
  palindex *= 0x20;
  for (int y = 0; y < 8; ++y) {
    uint8_t p0 = ppu.vram[tile + y * 2 + 0];      // bitplane 0
    uint8_t p1 = ppu.vram[tile + y * 2 + 1];      // bitplane 1
    uint8_t p2 = ppu.vram[tile + 16 + y * 2 + 0]; // bitplane 2
    uint8_t p3 = ppu.vram[tile + 16 + y * 2 + 1]; // bitplane 3
    int dy = py + y;
    if (Vflip) {
      dy = py + (7 - y);
    }
    
    if ((dy < 0) || dy >= SNES_HEIGHT) continue;
    for (int x = 0; x < 8; x++) {
      int dx = px + x;
      if ((dx < 0) || dx >= SNES_WIDTH) continue;
      
      int bit = Hflip ? x : (7 - x);
      uint8_t pindex =
        ((p0 >> bit) & 1) |
        (((p1 >> bit) & 1) << 1) |
        (((p2 >> bit) & 1) << 2) |
        (((p3 >> bit) & 1) << 3);
      
      uint16_t color16_0;
      uint16_t color16_1;
      uint32_t color32;
      if (palindex < 0) {
        color16_0 = dump_palette[pindex];
        color16_1 = dump_palette[pindex + 1];
        color32 = snes_color_to_rgb(color16_0+color16_1*256);
      } else {
        color16_0 = ppu.cgram[palindex + 2 * pindex];
        color16_1 = ppu.cgram[palindex + 2 * pindex + 1];
        color32 = snes_color_to_rgb(color16_0+color16_1*256);
      }
      if (pindex != 0) {
        framebuf[dx + SNES_WIDTH * dy] = color32;
      }
    }
  }
}

void draw_sprite_8x8_2bpp(int px, int py, int tile_index, int palindex, int Hflip, int Vflip)
{
  int tile = tile_index;
  
  palindex *= 8;
  for (int y = 0; y < 8; ++y) {
    int p = tile + 2 * y;
    if (p > 0xFFEF) { p = 0; }
    uint8_t p0 = ppu.vram[p];
    uint8_t p1 = ppu.vram[p + 1];
    int dy = py + y;
    if (Vflip) {
      dy = py + (7 - y);
    }
    
    if ((dy < 0) || dy >= SNES_HEIGHT) continue;
    for (int x = 0; x < 8; x++) {
      int dx = px + x;
      if ((dx < 0) || dx >= SNES_WIDTH) continue;
      
      int bit = Hflip ? x : (7 - x);
      uint8_t pindex =
        ((p0 >> bit) & 1) |
        (((p1 >> bit) & 1) << 1);
      
      uint16_t color16_0 = ppu.cgram[palindex + 2 * pindex];
      uint16_t color16_1 = ppu.cgram[palindex + 2 * pindex + 1];
      uint32_t color32 = snes_color_to_rgb(color16_0|(color16_1<<8));
      int pos = dx + SNES_WIDTH * dy;
      if (pindex != 0) {
        framebuf[pos] = color32;
      }
    }
  }
}

void draw_vram_2bpp(int offset)
{
  for (int i = 0; i < 1024; ++i) {
    int idx = offset + i*16;
    draw_sprite_8x8_2bpp((i%16)*8, (i/16)*8, idx, 0, 0, 0);
  }
}

void draw_vram_4bpp(int offset)
{
  for (int i = 0; i < 1024; ++i) {
    int idx = offset + i * 32;
    draw_sprite_8x8_4bpp((i%16)*8, (i/16)*8, idx, -1, 0, 0);
  }
}

/*
 * Scanline rendering.
 *
 * This used to draw the whole frame in one pass at NMI, from whatever PPU
 * register state happened to exist at that instant. That makes every
 * per-scanline effect impossible by construction -- and per-scanline effects
 * are how the SNES does gradients, fades, split scrolls and colour ramps, all
 * driven by HDMA. FF6's title sky is exactly that, which is why it came out
 * as flat horizontal bands.
 *
 * Now each line is rendered as the CPU reaches it, with that line's HDMA run
 * first, so the line sees the register values the game wrote for it.
 */

/* One BG layer, one scanline. bpp is 2, 4 or 8. */
static void draw_bg_scanline(int y, uint8_t BGSC, int chrbase, int bpp,
                             uint16_t hofs, uint16_t vofs)
{
  int width   = (BGSC & 1) ? 64 : 32;
  int height  = (BGSC & 2) ? 64 : 32;
  int map     = ((BGSC >> 2) & 0x3F) << 11;
  int bytes   = bpp * 8;                    /* bytes per 8x8 tile          */
  int palsize = (bpp == 2) ? 8 : 32;        /* CGRAM bytes per palette     */

  int ey   = (y + vofs) & (height * 8 - 1);
  int trow = ey >> 3;
  int fy   = ey & 7;

  for (int x = 0; x < SNES_WIDTH; ++x) {
    int ex   = (x + hofs) & (width * 8 - 1);
    int tcol = ex >> 3;
    int fx   = ex & 7;

    /*
     * A 64-tile-wide map is two 32x32 screens side by side and a 64-tall one
     * stacks them; each screen is 0x800 bytes. The old code masked the tile
     * index with a plain modulo and so folded all four onto the first.
     */
    int off;
    if (blockmap) {
      /*
       * What the hardware actually does: a 64-wide map is two 32x32 screens
       * side by side and a 64-tall one stacks them, each screen 0x800 bytes.
       * Left off by default because switching FF6 to it makes BG1 render as
       * opaque black over the whole screen -- the tilemap CONTENT in our VRAM
       * does not match this layout, which points at the upload path rather
       * than at the renderer, and is a separate bug to chase.
       */
      int scr = 0;
      if (tcol & 32) scr += 1;
      if (trow & 32) scr += (width == 64) ? 2 : 1;
      off = scr * 0x800 + (((trow & 31) * 32 + (tcol & 31)) * 2);
    } else {
      off = (trow * width + tcol) * 2;
    }

    uint16_t td = *(uint16_t *)&ppu.vram[(map + off) & 0xFFFE];
    int tile  = td & 0x3FF;
    int pal   = (td >> 10) & 7;
    int hflip = (td >> 14) & 1;
    int vflip = (td >> 15) & 1;

    int ty  = vflip ? (7 - fy) : fy;
    int bit = hflip ? fx : (7 - fx);
    int tp  = (chrbase + tile * bytes) & 0xFFFF;

    int pindex = 0;
    for (int plane = 0; plane < bpp; plane += 2) {
      int a = (tp + plane * 8 + ty * 2) & 0xFFFF;
      pindex |= ((ppu.vram[a]              >> bit) & 1) <<  plane;
      pindex |= ((ppu.vram[(a + 1) & 0xFFFF] >> bit) & 1) << (plane + 1);
    }
    if (!pindex) continue;                  /* colour 0 is transparent     */

    int c = (bpp == 8) ? pindex * 2 : pal * palsize + pindex * 2;
    framebuf[y * SNES_WIDTH + x] =
      snes_color_to_rgb(ppu.cgram[c & 0x1FF] | (ppu.cgram[(c + 1) & 0x1FF] << 8));
  }
}

/* OBJ sizes chosen by OBJSEL bits 5-7, indexed by the per-sprite size bit. */
static const int obj_w[8][2] = {{8,16},{8,32},{8,64},{16,32},{16,64},{32,64},{16,32},{16,32}};
static const int obj_h[8][2] = {{8,16},{8,32},{8,64},{16,32},{16,64},{32,64},{32,64},{32,32}};

static void draw_obj_scanline(int y)
{
  int objsize = (ppu.OBJSEL >> 5) & 7;
  int nb_sel  = (ppu.OBJSEL >> 3) & 3;
  int nb_addr = (ppu.OBJSEL & 7) << 14;

  /* Lower OAM index wins, so walk backwards and let earlier sprites overpaint. */
  for (int i = 127; i >= 0; --i) {
    int base = i * 4;
    int attr = ppu.oam[base + 3];
    int hi   = ppu.oam[512 + i / 4];
    int s    = (hi >> ((i % 4) * 2 + 1)) & 1;
    int w    = obj_w[objsize][s];
    int h    = obj_h[objsize][s];

    /* OAM Y is 8 bits, so a tall sprite near the bottom wraps into the top. */
    int sy = ppu.oam[base + 1] + 1;
    int ry = y - sy;
    if (ry < 0 || ry >= h) {
      ry = y + 256 - sy;
      if (ry < 0 || ry >= h) continue;
    }

    int sx = (((hi >> ((i % 4) * 2)) & 1) << 8) | ppu.oam[base + 0];
    if (sx > 255) sx -= 512;                /* the 9th bit is a sign bit   */

    int pal   = (attr >> 1) & 7;
    int hflip = (attr >> 6) & 1;
    int vflip = (attr >> 7) & 1;
    int tile  = ppu.oam[base + 2] + ((attr & 1) << 8);

    int oy = vflip ? (h - 1 - ry) : ry;
    for (int x = 0; x < w; ++x) {
      int dx = sx + x;
      if (dx < 0 || dx >= SNES_WIDTH) continue;
      int ox = hflip ? (w - 1 - x) : x;

      int t  = (tile + (oy >> 3) * 16 + (ox >> 3)) & 0x1FF;
      int tp = nb_addr + (t & 0xFF) * 0x20;
      if (t & 0x100) tp += (nb_sel + 1) << 13;

      int ty  = oy & 7;
      int bit = 7 - (ox & 7);
      int a0 = (tp + ty * 2) & 0xFFFF;
      int a1 = (tp + 16 + ty * 2) & 0xFFFF;
      int pindex = ( (ppu.vram[a0]                >> bit) & 1)
                 | (((ppu.vram[(a0 + 1) & 0xFFFF] >> bit) & 1) << 1)
                 | (((ppu.vram[a1]                >> bit) & 1) << 2)
                 | (((ppu.vram[(a1 + 1) & 0xFFFF] >> bit) & 1) << 3);
      if (!pindex) continue;

      int c = (8 + pal) * 32 + pindex * 2;   /* OBJ uses the upper CGRAM half */
      framebuf[y * SNES_WIDTH + dx] =
        snes_color_to_rgb(ppu.cgram[c & 0x1FF] | (ppu.cgram[(c + 1) & 0x1FF] << 8));
    }
  }
}

void draw_scanline(int y)
{
  uint32_t back = snes_color_to_rgb(ppu.cgram[0] | (ppu.cgram[1] << 8));
  for (int x = 0; x < SNES_WIDTH; ++x)
    framebuf[y * SNES_WIDTH + x] = back;

  if (!(ppu.INIDISP & 0x80)) {              /* forced blank draws nothing  */
    int tm   = ppu.TM & layer_mask;
    int chr1 = ( ppu.BG12NBA       & 0xF) << 13;
    int chr2 = ((ppu.BG12NBA >> 4) & 0xF) << 13;
    int chr3 = ( ppu.BG34NBA       & 0xF) << 13;

    /*
     * NOTE: this is BG1, BG2, BG3, which is not the hardware priority order
     * (BG3 belongs behind BG1 in mode 1). It is kept because reversing it
     * makes FF6 render as a black screen -- BG1's tiles come out opaque and
     * black, so whatever paints last wins. Fixing that needs the BG1 tilemap
     * content problem solved first; see SNESREC_BLOCKMAP.
     */
    switch (ppu.BGMODE & 7) {
      case 0:
        if (tm & 0x01) draw_bg_scanline(y, ppu.BG1SC, chr1, 2, ppu.BG1HOFS, ppu.BG1VOFS);
        if (tm & 0x02) draw_bg_scanline(y, ppu.BG2SC, chr2, 2, ppu.BG2HOFS, ppu.BG2VOFS);
        if (tm & 0x04) draw_bg_scanline(y, ppu.BG3SC, chr3, 2, ppu.BG3HOFS, ppu.BG3VOFS);
        break;
      case 1:
        if (tm & 0x01) draw_bg_scanline(y, ppu.BG1SC, chr1, 4, ppu.BG1HOFS, ppu.BG1VOFS);
        if (tm & 0x02) draw_bg_scanline(y, ppu.BG2SC, chr2, 4, ppu.BG2HOFS, ppu.BG2VOFS);
        if (tm & 0x04) draw_bg_scanline(y, ppu.BG3SC, chr3, 2, ppu.BG3HOFS, ppu.BG3VOFS);
        break;
      case 3:
        if (tm & 0x02) draw_bg_scanline(y, ppu.BG2SC, chr2, 4, ppu.BG2HOFS, ppu.BG2VOFS);
        if (tm & 0x01) draw_bg_scanline(y, ppu.BG1SC, chr1, 8, ppu.BG1HOFS, ppu.BG1VOFS);
        break;
      default:
        break;
    }
    if (tm & 0x10) draw_obj_scanline(y);
  }

  /*
   * Master brightness, per line. $2100 is one of the most common HDMA targets
   * there is, because that register is how fades are done.
   */
  int bright = (ppu.INIDISP & 0x80) ? 0 : (ppu.INIDISP & 0xF);
  if (bright != 15) {
    for (int x = 0; x < SNES_WIDTH; ++x) {
      uint32_t p = framebuf[y * SNES_WIDTH + x];
      uint32_t r = (((p >> 16) & 0xFF) * bright) / 15;
      uint32_t g = (((p >>  8) & 0xFF) * bright) / 15;
      uint32_t b = (( p        & 0xFF) * bright) / 15;
      framebuf[y * SNES_WIDTH + x] = (r << 16) | (g << 8) | b;
    }
  }
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
    return ((k + 0x80) << 16) | b;
  }
  return pc;
}

uint32_t pc_to_dummy(uint32_t pc)
{
  return pc;
}

extern "C" uint32_t pc_map(uint32_t pc)
{
  switch (MapMode) {
    case 0: return pc_to_LoRom(pc);
    case 1: return pc_to_HiRom(pc);
    default:
      return pc_to_dummy(pc);
  }
}