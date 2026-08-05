#!/usr/bin/env python3
"""Generate a synthetic trace + ROM covering every opcode, for regression testing.

WHY. recomp emits assembly as TEXT, so its entire output is diffable -- which
makes a restructure verifiable rather than hopeful, provided there is an input
that exercises every path. No trace ships with the project (they come from a
separately instrumented emulator), so this synthesises one.

Coverage is every opcode 0x00-0xFF crossed with both accumulator widths (M) and
both index widths (X), because decode_65C816() branches on both: 256 * 4 = 1024
instructions. That is not a substitute for a real trace -- the operand bytes are
synthetic and the control flow is not a real program -- but it does force every
opcode arm of the decoder to emit, which is exactly what a refactor can break.

Trace format, read by main() in recomp.cc:
    <headerloc hex> <MapMode dec>
    then rows of: M X type K pc ins      (dec dec dec hex hex hex)
where ins packs the instruction as op<<24 | A0<<16 | A1<<8 | A2.
"""
import os
import struct
import sys

OUT = os.path.dirname(os.path.abspath(__file__))
HEADERLOC = 0x7FC0          # LoROM header
MAPMODE = 0                 # 0 = LoROM; vectors get +0x800000

# Distinctive operand bytes: not 0x00, so a backend that drops an operand
# produces visibly different output rather than an accidentally-matching one.
A0, A1, A2 = 0x12, 0x34, 0x56


def write_rom(path):
    rom = bytearray(0x10000)
    # Vectors live at headerloc + these offsets, read as 16-bit LE.
    for off, vec in ((0x3C, 0x8000),   # Reset
                     (0x2A, 0x8100),   # NMI
                     (0x26, 0x8200),   # BRK
                     (0x24, 0x8300)):  # COP
        struct.pack_into("<H", rom, HEADERLOC + off, vec)
    with open(path, "wb") as f:
        f.write(rom)


# Relative branches, and the byte count each adds to PC before applying the
# offset. decode.cc only emits a taken branch when is_routines(target) holds --
# otherwise it emits "; Never branches to ...". Without marking the targets,
# every branch in the fixture took the not-taken path, so the compare and the
# jump emitted nothing at all and were silently untested.
BRANCH_REL8 = (0x10, 0x30, 0x50, 0x70, 0x90, 0xB0, 0xD0, 0xF0, 0x80)
BRANCH_REL16 = (0x82,)


def branch_target(op, pc):
    """Target of a relative branch, computed exactly as decode.cc does."""
    if op in BRANCH_REL8:
        rel = A0 - 256 if A0 > 127 else A0        # int8_t
        p = ((pc & 0xFFFF) + rel + 2) & 0xFFFF
    elif op in BRANCH_REL16:
        rel16 = (A1 << 8) | A0                    # INS_GETA10
        rel = rel16 - 0x10000 if rel16 > 0x7FFF else rel16
        p = ((pc & 0xFFFF) + rel + 3) & 0xFFFF
    else:
        return None
    return (pc & 0xFF0000) | p


def write_trace(path):
    rows = []
    pc = 0x808000
    for op in range(0x100):
        for m in (0, 1):
            for x in (0, 1):
                ins = (op << 24) | (A0 << 16) | (A1 << 8) | A2
                # type 1 marks a routine entry; mark a few so the routine
                # dispatch table in main() is exercised too.
                typ = 1 if (op % 64 == 0 and m == 0 and x == 0) else 0
                rows.append([m, x, typ, (pc >> 16) & 0xFF, pc, ins])
                pc += 4
                if (pc & 0xFFFF) >= 0xFFF0:      # stay inside the bank
                    pc = (pc & 0xFF0000) + 0x18000

    # Second pass: mark every reachable branch target as a routine, so the
    # taken path emits and the compare/jump it generates are actually covered.
    targets = set()
    for _, _, _, _, p, ins in rows:
        t = branch_target((ins >> 24) & 0xFF, p)
        if t is not None:
            targets.add(t)
    marked = 0
    for row in rows:
        if row[4] in targets and row[2] != 1:
            row[2] = 1
            marked += 1

    with open(path, "w") as f:
        f.write("%X\n%d\n" % (HEADERLOC, MAPMODE))
        for m, x, typ, k, p, ins in rows:
            f.write("%d %d %d %X %X %X\n" % (m, x, typ, k, p, ins))
    return len(rows), marked


if __name__ == "__main__":
    rom = os.path.join(OUT, "fixture.rom")
    trace = os.path.join(OUT, "fixture.trace")
    write_rom(rom)
    n, marked = write_trace(trace)
    print("wrote %s and %s (%d instructions, %d branch targets marked)"
          % (trace, rom, n, marked))
