/*
 * platform.h -- everything the runtime needs from the host OS.
 *
 * runtime.cc is ~1700 lines and almost all of it is portable SNES emulation:
 * the PPU renderers, the memory map, and the __* helpers the recompiled code
 * calls. Only display, input, timing and shutdown were tied to Win32, so those
 * live behind this interface and nothing else in the runtime names a host API.
 *
 * The display contract is deliberately narrow: the runtime hands over a
 * 256x224 XRGB8888 buffer and the backend decides how to get it on screen.
 * That is what lets the fbdev backend handle the pixel format conversion and
 * centring the Zaurus needs (its panel is 16bpp RGB565 at 320x240 or 240x320)
 * without the emulator knowing anything about it.
 */
#ifndef SNESREC_PLATFORM_H
#define SNESREC_PLATFORM_H

#include <stdint.h>

/*
 * Joypad bits, in the SNES's own JOY1H/JOY1L layout so the runtime can hand
 * them straight to the IO registers:
 *
 *   JOY1H (high byte)  B Y Select Start Up Down Left Right
 *   JOY1L (low byte)   A X L R - - - -
 */
#define PAD_B       0x8000
#define PAD_Y       0x4000
#define PAD_SELECT  0x2000
#define PAD_START   0x1000
#define PAD_UP      0x0800
#define PAD_DOWN    0x0400
#define PAD_LEFT    0x0200
#define PAD_RIGHT   0x0100
#define PAD_A       0x0080
#define PAD_X       0x0040
#define PAD_L       0x0020
#define PAD_R       0x0010

#ifdef __cplusplus
extern "C" {
#endif

/* 0 on success, negative on failure (message already printed). */
int plat_init(const char *title);

/* Put a w*h XRGB8888 buffer on screen. Format conversion, scaling and
 * centring are the backend's problem. */
void plat_present(const uint32_t *fb, int w, int h);

/* Buttons seen since the last call, as PAD_* bits. The Win32 original
 * accumulated keydowns and cleared after use; this keeps that model, which
 * matters because there is no key-release event on a raw terminal. */
uint16_t plat_poll(void);

/* Non-zero once the user has asked to quit. */
int plat_quit_requested(void);

void plat_shutdown(void);

#ifdef __cplusplus
}
#endif

#endif /* SNESREC_PLATFORM_H */
