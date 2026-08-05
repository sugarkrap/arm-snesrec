#!/bin/sh
# Regression check: does the recompiler still emit exactly what it used to?
#
# recomp turns a trace into assembly TEXT, so "did I break it" is a diff. The
# fixture (tests/gen_fixture.py) exercises 255 of 256 opcodes in all four
# (M,X) width combinations -- only 0xDB/STP has no decoder arm -- so a
# restructure that changes any opcode's emission shows up here immediately.
#
# This checks the x86_64 backend reproduces the golden byte for byte. It says
# nothing about whether that output is CORRECT, only that it is unchanged;
# correctness of the original is taken as given and this protects it.
#
#   tests/check.sh              compare against tests/golden-x86_64.asm
#   tests/check.sh --accept     regenerate the golden (only after a reviewed,
#                               intentional change to the output)
set -eu

cd "$(dirname "$0")/.."
GOLDEN=tests/golden-x86_64.asm
OUT=$(mktemp)
trap 'rm -f "$OUT"' EXIT

[ -f tests/fixture.trace ] && [ -f tests/fixture.rom ] || python3 tests/gen_fixture.py

g++ -O2 -I src -o "$OUT.bin" src/*.cc
"$OUT.bin" tests/fixture.trace tests/fixture.rom > "$OUT"

if [ "${1:-}" = "--accept" ]; then
    cp "$OUT" "$GOLDEN"
    echo "golden updated: $(wc -l < "$GOLDEN") lines"
    exit 0
fi

if ! diff -u "$GOLDEN" "$OUT" > /tmp/recomp-diff.txt 2>&1; then
    echo "FAIL: x86_64 output changed. First 40 lines of diff:"
    head -n 40 /tmp/recomp-diff.txt
    echo "..."
    echo "(full diff in /tmp/recomp-diff.txt; if the change is intended, review it"
    echo " then re-run with --accept)"
    exit 1
fi
echo "PASS: x86_64 output identical to golden ($(wc -l < "$GOLDEN") lines)"

# ---------------------------------------------------------------------------
# ARMv5: does the generated assembly actually assemble?
#
# The golden above only covers x86_64, so for a long stretch the ARM backend
# could not have assembled at all and nothing would have said so. It emitted
# `ldr rX, =value` everywhere without ever emitting a literal pool, and every
# decoder site ported off raw() added more of them -- so ARM breakage grew as
# the port progressed, silently. Reading the output cannot catch that; only an
# assembler can.
#
# Unported sites deliberately emit `.error "UNPORTED x86: ..."`, which cannot
# assemble by design, so they are stripped here along with the yasm-only
# directives the driver still emits. What remains is the PORTED subset, and
# that is what must be valid ARMv5. The counts are printed so this can never
# quietly pass by filtering everything away.
#
# Set AS_ARM to override the assembler; skipped (not failed) when absent, so
# the check still runs on machines without a cross toolchain.
# ---------------------------------------------------------------------------
AS_ARM="${AS_ARM:-$HOME/Code/piko/toolchain/x-tools/arm-unknown-linux-uclibcgnueabi/bin/arm-unknown-linux-uclibcgnueabi-as}"
if ! command -v "$AS_ARM" > /dev/null 2>&1; then
    echo "SKIP: ARMv5 assembly check (no assembler at $AS_ARM; set AS_ARM)"
    exit 0
fi

"$OUT.bin" --target armv5 tests/fixture.trace tests/fixture.rom > "$OUT.arm" 2>/dev/null
grep -v UNPORTED "$OUT.arm" | grep -vE '^(extern|  section|  global)' > "$OUT.armp"

total=$(wc -l < "$OUT.arm")
unported=$(grep -c UNPORTED "$OUT.arm" || true)
pools=$(grep -c '\.ltorg' "$OUT.armp" || true)
TAB=$(printf '\t')
insns=$(grep -c "^$TAB[a-z]" "$OUT.armp" || true)

if [ "$insns" -lt 1000 ]; then
    echo "FAIL: only $insns ARM instructions to check -- the filter is too broad"
    exit 1
fi

if "$AS_ARM" -march=armv5te -o /dev/null "$OUT.armp" 2> /tmp/recomp-as.txt; then
    echo "PASS: ARMv5 ported subset assembles ($insns insns, $pools literal pools)"
    echo "      $unported/$total lines still UNPORTED (grep UNPORTED to list)"
    exit 0
fi

echo "FAIL: ARMv5 output does not assemble. Error summary:"
grep Error /tmp/recomp-as.txt | sed 's/.*Error: //' | sed 's/`.*//' \
    | sort | uniq -c | sort -rn | head -n 15
echo "(full log in /tmp/recomp-as.txt, filtered source in $OUT.armp)"
exit 1
