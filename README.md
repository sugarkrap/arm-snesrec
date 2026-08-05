# arm-snesrec

![Lang](https://img.shields.io/badge/language-C%2B%2B-blue?style=flat-square&) ![License](https://img.shields.io/badge/license-MIT-green?style=flat-square) ![Status](https://img.shields.io/badge/status-Experimental-red?style=flat-square)

Static recompilation of SNES software to **ARMv5TE**, for the Sharp Zaurus
SL-C7xx/C860 (PXA255) running piko.

A fork of **SNESRecomp** by Marc-Daniel DALEBA, which recompiles SNES execution
traces into x86_64 assembly and runs them through a lightweight emulation
layer. This fork retargets that output to ARMv5, which also means a Linux/fbdev
runtime instead of the Win32 one.

## Why static recompilation, given the dynarec

The sibling effort — a **dynamic** recompiler inside PocketSNES (`dynarec/`) —
translates 65816 blocks to ARM at runtime. Measured on the device it reached
parity with the interpreter and no further, for reasons that are structural
rather than bugs:

- ~92% of executed opcodes still fall back to an interpreter function, and
  those functions dominate the time. Everything the dynarec does *around* the
  call is a small share of the total — removing 6 instructions per opcode from
  92% of execution measured **+1.0%**.
- Blocks average ~2 opcodes, because a 65816 block ends at every branch, so the
  fixed per-block cost (cache lookup, indirect call, prologue/epilogue) barely
  amortises.
- The zone profiler puts CPU emulation at **90.8%** of frame time on Final
  Fantasy 6, which still runs ~4x short of full speed. The target was right;
  the mechanism ran out of room.

Static recompilation attacks exactly those limits: no runtime translation to
amortise, no block-cache lookup, no per-block prologue, and the whole trace
visible at once — so the output can be a long run of native code instead of
two-opcode fragments reached through an indirect call.

What it gives up is generality. It needs a trace, it cannot cover paths the
trace never took, and anything self-modifying or dynamically generated has to
fall back. Those are real constraints, not footnotes.

## Layout

```
src/            recompiler, split by concern
platform/       host display/input backends (fbdev, win32)
tests/          fixture generator + golden-output regression check
runtime.cc      runtime / emulation layer (was emu.cc)
snes.h          shared SNES definitions
```

The recompiler and the runtime are separate programs and deliberately do not
share a source directory -- a glob over both would drag `platform_win32.cc`
into the recompiler build.

## Building and testing

The recompiler is portable C++ and builds anywhere:

```sh
make            # build the recompiler
make check      # both regression gates
```

To go all the way to an ARM binary:

```sh
make game TRACE=your.trace ROM=your.sfc     # -> ./snesrec-arm
```

To test without hardware, build the headless backend and run it under qemu --
frames come out as PPM, which is how the screenshot below was produced:

```sh
make game PLATFORM=file TRACE=t ROM=r
SNESREC_OUT=/tmp/frames SNESREC_FRAMES=12 qemu-arm ./snesrec-arm r
```

`PLATFORM=fbdev` (default) targets the device, `file` is headless, `win32`
keeps the original path. Traces come from PocketSNES built with `make TRACE=1`
(see `trace/snes_trace.c` there).

That refuses to build while any `.error` marker remains, listing exactly which
sites block it. `ALLOW_UNPORTED=1` strips them and builds anyway, at the cost
of a binary whose behaviour on those paths is undefined — useful for testing
the rest of the pipeline, not for running a game.

`tests/check.sh` synthesises a trace exercising **255 of the 256 opcodes** in
all four (M,X) width combinations, then runs two independent gates. Only
`0xDB` (STP) has no decoder arm.

1. **x86_64 golden diff.** The emitted assembly is compared against
   `tests/golden-x86_64.asm`. Because the output is text, any change is caught
   exactly. This is a *no-change* check, not a correctness proof — and note
   that porting a family off `raw()` legitimately changes x86 output (ARM has
   no memory-operand ALU, so `and word [rel regA], ax` must become
   load/modify/store). Those diffs get reviewed line by line and accepted with
   `--accept`, so the golden is a reviewed change log, not a frozen invariant.

2. **ARMv5 assembly.** The ARM output is run through a real assembler. Nothing
   else can catch the failure mode this backend actually has: it emits
   `ldr rX, =value` everywhere, each needing a literal pool within ±4 KB, and
   every site ported off `raw()` adds more — so ARM breakage *grows* as the
   port progresses, invisibly to gate 1. Unported sites emit `.error` markers
   and are stripped before assembling; the check reports how many instructions
   it actually verified so it cannot pass by filtering everything away.

Set `AS_ARM` to point at a cross assembler; gate 2 skips (rather than fails)
when none is present.

## Status

Stated plainly so nobody rediscovers these the hard way:

- **The runtime runs on Linux now.** `runtime.cc` names no host API; display,
  input, timing and shutdown sit behind `platform/platform.h`. The fbdev
  backend takes its pixel format from `FBIOGET_VSCREENINFO` rather than
  assuming RGB565, and centres *and clips* -- the Zaurus's 240-wide portrait
  panel is narrower than the SNES's 256, so part of the image genuinely does
  not fit. Input is a raw terminal rather than evdev, so it works over SSH.
- **The ARMv5 backend emits ARM for essentially everything.** The decoder is
  fully ported (0 `raw()` sites) and the output assembles: ~23.7k instructions
  for the test fixture. Two `.error` markers remain, both in one place — the
  `add rsp, 32` / `pop rax` pair that discards `__CPUSync`'s return frame so
  the following jump becomes a tail-jump. AAPCS has no pushed return address
  (`lr` holds it), and generated code has no prologue, so this needs the ARM
  calling convention for generated code settled first. It is a design
  decision, not a translation.
- **The `in_wram()` self-modifying-code guard is unported**, and the fixture
  does not reach it — every fixture PC is in ROM. It stays as `raw()` so a
  WRAM trace fails loudly rather than silently emitting x86.
- **It works, for as far as the trace goes.** Final Fantasy VI, traced on a
  Zaurus and statically recompiled to ARMv5, renders its title screen
  correctly under `qemu-arm` -- and the palette fade animates across frames,
  so this is real execution rather than a single blit. **Confirmed on the
  device too**: the Zaurus displays the title card from the same binary.
- **Three backends, cross-checked.** The x86_64 System V build and the ARMv5
  build render byte-identical frames from the same trace. They share nothing
  but that trace -- different ABI, different register allocation, different
  assembler -- so agreement between them is a real correctness signal, not a
  restatement of one result.
- **A trace only covers what it saw.** The FF6 trace above is ~2 minutes of
  boot: 11,417 instructions of a 4 MB ROM. Everything outside it has no
  generated code and dispatches to `__JUMP_FAILED`. This is the central
  limitation of the approach, not a bug.
- **No SPC700, and this is the current blocker -- not trace coverage.**
  Recompiled FF6 renders its title screen and then stops advancing. It is not
  running out of traced code: `__JUMP_FAILED` prints and exits, and the binary
  runs hundreds of frames without it. The APU stub was improved from constants
  to echoing writes (a constant provably cannot satisfy the IPL handshake's
  echo-wait), which did **not** unblock it either. Getting further needs a real
  SPC700, or the game's audio waits patched out -- which is what upstream means
  by "short-circuited". That is a substantial piece of work, not a stub tweak.
- **Traces come from a separately instrumented emulator** and are not included.
  `tests/gen_fixture.py` synthesises one for testing the recompiler, but it is
  not a real program and cannot be executed.

## Screenshot

Earthbound alongside part of the generated assembly (upstream, x86_64):

![Screenshot of reassembled Earthbound](images/screenshot.png)

## Credit

Upstream SNESRecomp and the entire 65816 decoder are Marc-Daniel DALEBA's work,
MIT licensed. This fork adds the target-agnostic emission layer, the ARMv5
backend and the regression harness.
