/*
 * platform_fbdev.cc -- Linux framebuffer + raw-terminal input.
 *
 * Target is piko on the Sharp Zaurus SL-C7xx/C860: a w100 (ATI Imageon) panel
 * exposed as /dev/fb0, typically 16bpp RGB565 at 320x240 or 240x320 depending
 * on rotation. Neither dimension is guaranteed to be larger than the SNES's
 * 256x224, so the blit centres AND clips -- on a 240-wide portrait panel the
 * left and right edges of the SNES image genuinely do not fit.
 *
 * Pixel format comes from FBIOGET_VSCREENINFO rather than being assumed:
 * the red/green/blue bitfield offsets and lengths are used directly, so this
 * works on RGB565, BGR565 and the 32bpp cases without special-casing each.
 *
 * Input is the controlling terminal in raw mode, not evdev. That is a
 * deliberate choice: it works identically over SSH, which is how this will
 * actually be driven on a device with no usable keyboard for a test harness.
 * Arrow keys arrive as ESC [ A..D escape sequences and are decoded as such.
 */
#include <errno.h>
#include <fcntl.h>
#include <linux/fb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <termios.h>
#include <unistd.h>

#include "platform.h"

static int fb_fd = -1;
static uint8_t *fb_mem = NULL;
static size_t fb_len = 0;
static struct fb_var_screeninfo vinfo;
static struct fb_fix_screeninfo finfo;

static struct termios tty_saved;
static int tty_raw = 0;
static int quit_flag = 0;

/* Pack an XRGB8888 pixel into whatever the panel wants, per its bitfields. */
static inline uint32_t pack(uint32_t rgb)
{
	uint32_t r = (rgb >> 16) & 0xFF;
	uint32_t g = (rgb >> 8) & 0xFF;
	uint32_t b = rgb & 0xFF;

	/* Narrow each channel to the panel's bit depth, then shift into place. */
	r >>= (8 - vinfo.red.length);
	g >>= (8 - vinfo.green.length);
	b >>= (8 - vinfo.blue.length);

	return (r << vinfo.red.offset)
	     | (g << vinfo.green.offset)
	     | (b << vinfo.blue.offset);
}

static void tty_restore(void)
{
	if (tty_raw) {
		tcsetattr(STDIN_FILENO, TCSANOW, &tty_saved);
		tty_raw = 0;
	}
}

static int tty_setup(void)
{
	struct termios raw;

	if (!isatty(STDIN_FILENO))
		return 0;            /* piped input: not an error, just no keys */

	if (tcgetattr(STDIN_FILENO, &tty_saved) < 0)
		return 0;

	raw = tty_saved;
	raw.c_lflag &= ~(ICANON | ECHO);   /* unbuffered, no echo */
	raw.c_cc[VMIN] = 0;                /* fully non-blocking reads */
	raw.c_cc[VTIME] = 0;
	if (tcsetattr(STDIN_FILENO, TCSANOW, &raw) < 0)
		return 0;

	tty_raw = 1;
	fcntl(STDIN_FILENO, F_SETFL, fcntl(STDIN_FILENO, F_GETFL, 0) | O_NONBLOCK);
	return 0;
}

int plat_init(const char *title)
{
	const char *dev = getenv("SNESREC_FB");

	if (!dev)
		dev = "/dev/fb0";

	fb_fd = open(dev, O_RDWR);
	if (fb_fd < 0) {
		fprintf(stderr, "fbdev: cannot open %s: %s\n", dev, strerror(errno));
		return -1;
	}
	if (ioctl(fb_fd, FBIOGET_VSCREENINFO, &vinfo) < 0 ||
	    ioctl(fb_fd, FBIOGET_FSCREENINFO, &finfo) < 0) {
		fprintf(stderr, "fbdev: screeninfo ioctl failed: %s\n", strerror(errno));
		close(fb_fd);
		fb_fd = -1;
		return -1;
	}

	fb_len = finfo.smem_len;
	fb_mem = (uint8_t *)mmap(NULL, fb_len, PROT_READ | PROT_WRITE,
	                         MAP_SHARED, fb_fd, 0);
	if (fb_mem == MAP_FAILED) {
		fprintf(stderr, "fbdev: mmap failed: %s\n", strerror(errno));
		close(fb_fd);
		fb_fd = -1;
		fb_mem = NULL;
		return -1;
	}

	fprintf(stderr, "%s: %ux%u %ubpp, line=%u bytes (R%u/%u G%u/%u B%u/%u)\n",
	        title, vinfo.xres, vinfo.yres, vinfo.bits_per_pixel,
	        finfo.line_length,
	        vinfo.red.offset, vinfo.red.length,
	        vinfo.green.offset, vinfo.green.length,
	        vinfo.blue.offset, vinfo.blue.length);

	if (vinfo.bits_per_pixel != 16 && vinfo.bits_per_pixel != 32) {
		fprintf(stderr, "fbdev: unsupported depth %u (want 16 or 32)\n",
		        vinfo.bits_per_pixel);
		plat_shutdown();
		return -1;
	}

	tty_setup();
	return 0;
}

void plat_present(const uint32_t *src, int w, int h)
{
	int dst_x0, dst_y0, y;

	if (!fb_mem)
		return;

	/* Centre. These go negative when the panel is smaller than the SNES
	 * image, which is the normal case on a 240-wide QVGA panel, so every
	 * loop below is clipped rather than assuming the image fits. */
	dst_x0 = ((int)vinfo.xres - w) / 2;
	dst_y0 = ((int)vinfo.yres - h) / 2;

	for (y = 0; y < h; y++) {
		int dy = dst_y0 + y;
		const uint32_t *srow;
		uint8_t *drow;
		int x;

		if (dy < 0 || dy >= (int)vinfo.yres)
			continue;

		srow = src + (size_t)y * w;
		drow = fb_mem + (size_t)(dy + vinfo.yoffset) * finfo.line_length;

		for (x = 0; x < w; x++) {
			int dx = dst_x0 + x;

			if (dx < 0 || dx >= (int)vinfo.xres)
				continue;

			if (vinfo.bits_per_pixel == 16)
				*(uint16_t *)(drow + (size_t)(dx + vinfo.xoffset) * 2) =
					(uint16_t)pack(srow[x]);
			else
				*(uint32_t *)(drow + (size_t)(dx + vinfo.xoffset) * 4) =
					pack(srow[x]);
		}
	}
}

uint16_t plat_poll(void)
{
	uint8_t buf[64];
	ssize_t n, i;
	uint16_t pad = 0;

	if (!tty_raw)
		return 0;

	while ((n = read(STDIN_FILENO, buf, sizeof(buf))) > 0) {
		for (i = 0; i < n; i++) {
			/* Arrow keys: ESC [ A/B/C/D. Decoded here rather than
			 * relying on a terminfo database that may not exist on a
			 * minimal rootfs. */
			if (buf[i] == 0x1B && i + 2 < n && buf[i + 1] == '[') {
				switch (buf[i + 2]) {
				case 'A': pad |= PAD_UP;    break;
				case 'B': pad |= PAD_DOWN;  break;
				case 'C': pad |= PAD_RIGHT; break;
				case 'D': pad |= PAD_LEFT;  break;
				}
				i += 2;
				continue;
			}

			switch (buf[i]) {
			case 'w': case 'W': pad |= PAD_UP;     break;
			case 's': case 'S': pad |= PAD_DOWN;   break;
			case 'a': case 'A': pad |= PAD_LEFT;   break;
			case 'd': case 'D': pad |= PAD_RIGHT;  break;
			case 'k': case 'K': pad |= PAD_A;      break;
			case 'j': case 'J': pad |= PAD_B;      break;
			case 'i': case 'I': pad |= PAD_X;      break;
			case 'u': case 'U': pad |= PAD_Y;      break;
			case '\n': case '\r': pad |= PAD_START; break;
			case ' ': pad |= PAD_SELECT; break;
			case 'q': case 'Q': case 0x03: /* ^C */
				quit_flag = 1;
				break;
			}
		}
		if (n < (ssize_t)sizeof(buf))
			break;
	}

	return pad;
}

int plat_quit_requested(void)
{
	return quit_flag;
}

void plat_shutdown(void)
{
	tty_restore();
	if (fb_mem) {
		munmap(fb_mem, fb_len);
		fb_mem = NULL;
	}
	if (fb_fd >= 0) {
		close(fb_fd);
		fb_fd = -1;
	}
}
