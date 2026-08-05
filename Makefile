# arm-snesrec
#
#   make                 build the recompiler (host)
#   make check           run both regression gates
#   make runtime         build the runtime for the host (fbdev)
#   make arm-runtime     cross-build the runtime for ARMv5
#   make game TRACE=t ROM=r    full pipeline -> ./snesrec-arm
#
# ARM_PREFIX points at a cross toolchain; the default is piko's.

ARM_PREFIX ?= $(HOME)/Code/piko/toolchain/x-tools/arm-unknown-linux-uclibcgnueabi/bin/arm-unknown-linux-uclibcgnueabi
ARM_CXX    := $(ARM_PREFIX)-g++
ARM_AS     := $(ARM_PREFIX)-as
ARM_CFLAGS := -O2 -march=armv5te

CXX      ?= g++
CXXFLAGS ?= -O2

# The recompiler and the runtime are separate programs and deliberately do not
# share a source directory: src/ is the recompiler, runtime.cc + platform/ is
# the runtime. A glob over both would drag platform_win32.cc into the
# recompiler build.
RECOMP_SRC := $(wildcard src/*.cc)

.PHONY: all check runtime arm-runtime game clean

all: recomp

recomp: $(RECOMP_SRC)
	$(CXX) $(CXXFLAGS) -Isrc -o $@ $(RECOMP_SRC)

check: recomp
	@sh tests/check.sh

# Host build, still fbdev -- useful on a Linux desktop with a real /dev/fb0,
# or pointed elsewhere with SNESREC_FB.
runtime: runtime.cc platform/platform_fbdev.cc
	$(CXX) $(CXXFLAGS) -I. -Iplatform -c -o runtime.o runtime.cc
	$(CXX) $(CXXFLAGS) -Iplatform -c -o platform.o platform/platform_fbdev.cc

arm-runtime: runtime.cc platform/platform_fbdev.cc
	$(ARM_CXX) $(ARM_CFLAGS) -I. -Iplatform -c -o runtime-arm.o runtime.cc
	$(ARM_CXX) $(ARM_CFLAGS) -Iplatform -c -o platform-arm.o platform/platform_fbdev.cc

# Full pipeline: trace -> ARM assembly -> object -> statically linked binary.
#
# The .error check is the point of the marker: an unported emission site must
# stop the build loudly rather than be quietly dropped, because dropping it
# produces a binary that links and then misbehaves in a way no test would
# attribute to the missing instructions.
game: recomp arm-runtime
	@test -n "$(TRACE)" -a -n "$(ROM)" || { echo "usage: make game TRACE=t ROM=r"; exit 1; }
	./recomp --target armv5 $(TRACE) $(ROM) > generated.s
	@if grep -q '\.error' generated.s; then \
	    echo "FAIL: generated.s has $$(grep -c '\.error' generated.s) unported site(s):"; \
	    grep '\.error' generated.s | sed 's/.*UNPORTED x86: /  /' | sort -u; \
	    echo "Port them, or build with ALLOW_UNPORTED=1 to strip them and accept"; \
	    echo "a binary whose behaviour on those paths is undefined."; \
	    test -n "$(ALLOW_UNPORTED)" || exit 1; \
	    grep -v '\.error' generated.s > generated.tmp && mv generated.tmp generated.s; \
	fi
	$(ARM_AS) -march=armv5te -o generated.o generated.s
	$(ARM_CXX) -static -o snesrec-arm generated.o runtime-arm.o platform-arm.o
	@echo "built ./snesrec-arm"

clean:
	rm -f recomp *.o generated.s generated.o snesrec-arm
