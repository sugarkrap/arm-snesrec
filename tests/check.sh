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

if diff -u "$GOLDEN" "$OUT" > /tmp/recomp-diff.txt 2>&1; then
    echo "PASS: x86_64 output identical to golden ($(wc -l < "$GOLDEN") lines)"
    exit 0
fi

echo "FAIL: x86_64 output changed. First 40 lines of diff:"
head -n 40 /tmp/recomp-diff.txt
echo "..."
echo "(full diff in /tmp/recomp-diff.txt; if the change is intended, review it"
echo " then re-run with --accept)"
exit 1
