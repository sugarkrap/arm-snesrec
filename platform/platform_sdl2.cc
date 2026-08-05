/*
 * platform_sdl2.cc -- windowed backend for running on a build host.
 *
 * The fbdev backend needs /dev/fb0, which on a desktop is root:video and so
 * unavailable to an ordinary user; the file backend is headless. Neither lets
 * you simply watch the recompiled game run and press buttons at it. This does,
 * using SDL2, which is what a Linux desktop actually has (PocketSNES's own SAL
 * wants SDL1, a different and largely absent library).
 *
 * Nothing here is used on the Zaurus -- it is a development convenience, and
 * the reason the x86_64 System V build is worth having at all.
 */
#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdlib.h>

#include "platform.h"

#define SCALE 3

static SDL_Window *win;
static SDL_Renderer *ren;
static SDL_Texture *tex;
static int quit_flag;
static int tex_w, tex_h;

int plat_init(const char *title)
{
	if (SDL_Init(SDL_INIT_VIDEO) != 0) {
		fprintf(stderr, "sdl2: init failed: %s\n", SDL_GetError());
		return -1;
	}
	win = SDL_CreateWindow(title, SDL_WINDOWPOS_CENTERED,
	                       SDL_WINDOWPOS_CENTERED,
	                       256 * SCALE, 224 * SCALE, SDL_WINDOW_RESIZABLE);
	if (!win) {
		fprintf(stderr, "sdl2: window failed: %s\n", SDL_GetError());
		return -1;
	}
	ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED);
	if (!ren)
		ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_SOFTWARE);
	if (!ren) {
		fprintf(stderr, "sdl2: renderer failed: %s\n", SDL_GetError());
		return -1;
	}
	fprintf(stderr, "%s: SDL2 window %dx%d\n", title, 256 * SCALE, 224 * SCALE);
	return 0;
}

void plat_present(const uint32_t *fb, int w, int h)
{
	/* The runtime hands over XRGB8888, which is exactly SDL_PIXELFORMAT_ARGB8888
	 * on a little-endian host -- no conversion needed. */
	if (!tex || tex_w != w || tex_h != h) {
		if (tex) SDL_DestroyTexture(tex);
		tex = SDL_CreateTexture(ren, SDL_PIXELFORMAT_ARGB8888,
		                        SDL_TEXTUREACCESS_STREAMING, w, h);
		tex_w = w; tex_h = h;
	}
	if (!tex)
		return;
	SDL_UpdateTexture(tex, NULL, fb, w * (int)sizeof(uint32_t));
	SDL_RenderClear(ren);
	SDL_RenderCopy(ren, tex, NULL, NULL);
	SDL_RenderPresent(ren);
}

uint16_t plat_poll(void)
{
	SDL_Event e;
	const Uint8 *k;
	uint16_t pad = 0;

	while (SDL_PollEvent(&e)) {
		if (e.type == SDL_QUIT)
			quit_flag = 1;
		if (e.type == SDL_KEYDOWN && e.key.keysym.sym == SDLK_ESCAPE)
			quit_flag = 1;
	}

	/* Level-triggered: a held key should stay held, unlike the terminal
	 * backend where only presses are observable. */
	k = SDL_GetKeyboardState(NULL);
	if (k[SDL_SCANCODE_UP]     || k[SDL_SCANCODE_W]) pad |= PAD_UP;
	if (k[SDL_SCANCODE_DOWN]   || k[SDL_SCANCODE_S]) pad |= PAD_DOWN;
	if (k[SDL_SCANCODE_LEFT]   || k[SDL_SCANCODE_A]) pad |= PAD_LEFT;
	if (k[SDL_SCANCODE_RIGHT]  || k[SDL_SCANCODE_D]) pad |= PAD_RIGHT;
	if (k[SDL_SCANCODE_RETURN]) pad |= PAD_START;
	if (k[SDL_SCANCODE_SPACE])  pad |= PAD_SELECT;
	if (k[SDL_SCANCODE_K])      pad |= PAD_A;
	if (k[SDL_SCANCODE_J])      pad |= PAD_B;
	if (k[SDL_SCANCODE_I])      pad |= PAD_X;
	if (k[SDL_SCANCODE_U])      pad |= PAD_Y;
	return pad;
}

int plat_quit_requested(void) { return quit_flag; }

void plat_shutdown(void)
{
	if (tex) SDL_DestroyTexture(tex);
	if (ren) SDL_DestroyRenderer(ren);
	if (win) SDL_DestroyWindow(win);
	tex = NULL; ren = NULL; win = NULL;
	SDL_Quit();
}
