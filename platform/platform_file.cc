/*
 * platform_file.cc -- headless backend: frames go to files, not a screen.
 *
 * This exists to make the pipeline testable without hardware. The fbdev
 * backend needs real FBIOGET_VSCREENINFO/FBIOGET_FSCREENINFO ioctls, so there
 * is nothing on a build host to run it against, and on the device itself the
 * w100's framebuffer cannot be read back with dd (it needs mmap) -- which is
 * exactly why "does it actually render?" went unanswered.
 *
 * Here the generated ARM binary runs under qemu-arm on the host and every
 * frame is written out as a binary PPM, which can simply be looked at.
 *
 *   SNESREC_OUT     directory for frames        (default ".")
 *   SNESREC_FRAMES  exit cleanly after N frames (default 0 = never)
 *   SNESREC_EVERY   write only every Nth frame  (default 1)
 *   SNESREC_KEYS    scripted input, applied one entry per frame, e.g.
 *                   "start,,,a,up" -- commas separate frames, so empty
 *                   entries are frames with no input held.
 *   SNESREC_MASH    hold the same START/A cadence PocketSNES's
 *                   PIKO_TRACE_MASH uses, forever; overrides SNESREC_KEYS.
 *                   Use this when comparing a run against a tracer capture.
 *
 * PPM rather than PNG deliberately: no zlib, no encoder, and nothing to get
 * subtly wrong between the emulator's pixels and the file's bytes.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "platform.h"

static char out_dir[512] = ".";
static unsigned long frame_no;
static unsigned long max_frames;
static unsigned long every = 1;
static int quit_flag;

/* Scripted input: a comma-separated list, one entry per frame. */
static char *key_script;
static char **key_frames;
static unsigned long n_key_frames;
static int mash;

static uint16_t parse_keys(const char *spec)
{
	uint16_t pad = 0;
	const char *p = spec;

	while (*p) {
		if      (!strncmp(p, "up",     2)) { pad |= PAD_UP;     p += 2; }
		else if (!strncmp(p, "down",   4)) { pad |= PAD_DOWN;   p += 4; }
		else if (!strncmp(p, "left",   4)) { pad |= PAD_LEFT;   p += 4; }
		else if (!strncmp(p, "right",  5)) { pad |= PAD_RIGHT;  p += 5; }
		else if (!strncmp(p, "start",  5)) { pad |= PAD_START;  p += 5; }
		else if (!strncmp(p, "select", 6)) { pad |= PAD_SELECT; p += 6; }
		else if (*p == 'a') { pad |= PAD_A; p++; }
		else if (*p == 'b') { pad |= PAD_B; p++; }
		else if (*p == 'x') { pad |= PAD_X; p++; }
		else if (*p == 'y') { pad |= PAD_Y; p++; }
		else p++;                       /* separators and anything unknown */
	}
	return pad;
}

int plat_init(const char *title)
{
	const char *d = getenv("SNESREC_OUT");
	const char *n = getenv("SNESREC_FRAMES");
	const char *e = getenv("SNESREC_EVERY");
	const char *k = getenv("SNESREC_KEYS");

	if (d && *d) {
		strncpy(out_dir, d, sizeof(out_dir) - 1);
		out_dir[sizeof(out_dir) - 1] = '\0';
	}
	mash = getenv("SNESREC_MASH") ? 1 : 0;
	if (n) max_frames = strtoul(n, NULL, 0);
	if (e) { every = strtoul(e, NULL, 0); if (!every) every = 1; }

	if (k && *k) {
		/* Split on commas up front; one entry per frame. */
		unsigned long i, count = 1;
		char *p;
		key_script = strdup(k);
		for (p = key_script; *p; p++)
			if (*p == ',') count++;
		key_frames = (char **)calloc(count, sizeof(char *));
		if (key_script && key_frames) {
			key_frames[0] = key_script;
			n_key_frames = 1;
			for (p = key_script; *p; p++) {
				if (*p == ',') {
					*p = '\0';
					key_frames[n_key_frames++] = p + 1;
				}
			}
			(void)i;
		}
	}

	fprintf(stderr, "%s: headless, frames -> %s/frame%%05lu.ppm%s\n",
	        title, out_dir, max_frames ? " (bounded)" : "");
	return 0;
}

void plat_present(const uint32_t *fb, int w, int h)
{
	char path[600];
	FILE *f;
	int x, y;

	if (frame_no % every == 0) {
		snprintf(path, sizeof(path), "%s/frame%05lu.ppm", out_dir, frame_no);
		f = fopen(path, "wb");
		if (f) {
			fprintf(f, "P6\n%d %d\n255\n", w, h);
			for (y = 0; y < h; y++) {
				for (x = 0; x < w; x++) {
					uint32_t p = fb[(size_t)y * w + x];
					unsigned char rgb[3];
					rgb[0] = (unsigned char)((p >> 16) & 0xFF);
					rgb[1] = (unsigned char)((p >> 8) & 0xFF);
					rgb[2] = (unsigned char)(p & 0xFF);
					fwrite(rgb, 1, 3, f);
				}
			}
			fclose(f);
		}
	}

	frame_no++;
	if (max_frames && frame_no >= max_frames) {
		fprintf(stderr, "headless: %lu frames done\n", frame_no);
		quit_flag = 1;
	}
}

uint16_t plat_poll(void)
{
	/* SNESREC_MASH mirrors PocketSNES's PIKO_TRACE_MASH byte for byte: a
	 * 120-frame cycle holding START for frames 0-5 and A for frames 60-65.
	 * The point is not to play well but to feed the recompiled binary the
	 * SAME input the tracer fed the interpreter -- without that, any
	 * divergence between the two runs is just "one of them pressed start",
	 * which tells you nothing. SNESREC_KEYS cannot do this: it is a finite
	 * list that runs out, so it cannot hold a cadence over a long trace. */
	if (mash) {
		unsigned long phase = frame_no % 120;
		if (phase < 6)                return PAD_START;
		if (phase >= 60 && phase < 66) return PAD_A;
		return 0;
	}
	if (!key_frames || frame_no >= n_key_frames)
		return 0;
	return parse_keys(key_frames[frame_no]);
}

int plat_quit_requested(void)
{
	return quit_flag;
}

void plat_shutdown(void)
{
	free(key_frames);
	free(key_script);
	key_frames = NULL;
	key_script = NULL;
}
