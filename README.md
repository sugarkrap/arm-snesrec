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
tests/          fixture generator + golden-output regression check
emu.cc          runtime / emulation layer  (Win32 today -- see Status)
snes.h          shared SNES definitions
```

## Building and testing

The recompiler is portable C++ and builds anywhere:

```sh
g++ -O2 -I src -o recomp src/*.cc
tests/check.sh
```

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

- **The recompiler runs on Linux; the runtime does not.** `emu.cc` includes
  `windows.h` and links `-lwinmm -lgdi32`. Getting anything onto the Zaurus
  needs an fbdev/evdev runtime, which does not exist yet.
- **The ARMv5 backend is partial.** Its emission primitives are implemented and
  the ported subset assembles cleanly, but ~5.5k decoder sites still emit
  `.error` markers instead of ARM, so the full output does not yet assemble.
  `grep -c 'E->raw(' src/decode.cc` is the remaining work list.
- **No SPC700, so no audio.** Games need their audio-handshake routines
  short-circuited to run at all. Inherited from upstream.
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
