/*
 * platform_win32.cc -- the original Win32 display/input path.
 *
 * Extracted verbatim in behaviour from emu.cc (now runtime.cc) so retargeting
 * to fbdev does not cost the platform the project was developed on. The
 * StretchDIBits blit, the 4x window size and the key mapping are all as they
 * were; only the plumbing changed.
 */
#include <windows.h>
#include <stdio.h>

#include "platform.h"

#define SNES_WIDTH  (256)
#define SNES_HEIGHT (224)

static HWND ghwnd;
static BITMAPINFO bmi;
static const uint32_t *cur_fb;
static uint16_t pad_accum;
static int quit_flag;

static LRESULT CALLBACK WindowProc(HWND h, UINT m, WPARAM w, LPARAM l)
{
	switch (m) {
	case WM_CLOSE:
		quit_flag = 1;
		PostQuitMessage(0);
		break;

	case WM_PAINT: {
		PAINTSTRUCT ps;
		BeginPaint(ghwnd, &ps);
		if (cur_fb) {
			StretchDIBits(ps.hdc, 0, 0,
			              ps.rcPaint.right - ps.rcPaint.left,
			              ps.rcPaint.bottom - ps.rcPaint.top,
			              0, 0, SNES_WIDTH, SNES_HEIGHT,
			              (VOID *)cur_fb, &bmi, DIB_RGB_COLORS, SRCCOPY);
		}
		EndPaint(ghwnd, &ps);
		break;
	}

	case WM_KEYDOWN:
		if (w == 'A')       pad_accum |= PAD_A;
		if (w == VK_RETURN) pad_accum |= PAD_START;
		if (w == VK_UP)     pad_accum |= PAD_UP;
		if (w == VK_DOWN)   pad_accum |= PAD_DOWN;
		if (w == VK_LEFT)   pad_accum |= PAD_LEFT;
		if (w == VK_RIGHT)  pad_accum |= PAD_RIGHT;
		break;

	default:
		return DefWindowProc(h, m, w, l);
	}
	return 0;
}

int plat_init(const char *title)
{
	WNDCLASS wc;
	HINSTANCE hInstance = GetModuleHandle(NULL);

	memset(&wc, '\0', sizeof(wc));
	wc.lpfnWndProc = WindowProc;
	wc.lpszClassName = "SNES RECOMP EMU";
	wc.hInstance = hInstance;
	if (!RegisterClass(&wc)) {
		fprintf(stderr, "win32: RegisterClass failed\n");
		return -1;
	}

	ghwnd = CreateWindowEx(0, wc.lpszClassName, title,
	                       WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT,
	                       SNES_WIDTH * 4, SNES_HEIGHT * 4,
	                       NULL, NULL, hInstance, NULL);
	if (!ghwnd) {
		fprintf(stderr, "win32: CreateWindowEx failed\n");
		return -1;
	}

	memset(&bmi, '\0', sizeof(bmi));
	bmi.bmiHeader.biSize        = sizeof(BITMAPINFOHEADER);
	bmi.bmiHeader.biWidth       = SNES_WIDTH;
	bmi.bmiHeader.biHeight      = -SNES_HEIGHT;   /* top-down */
	bmi.bmiHeader.biPlanes      = 1;
	bmi.bmiHeader.biBitCount    = 32;
	bmi.bmiHeader.biCompression = BI_RGB;

	ShowWindow(ghwnd, SW_NORMAL);
	timeBeginPeriod(1);
	return 0;
}

static void pump(void)
{
	MSG msg;
	memset(&msg, '\0', sizeof(msg));
	while (PeekMessage(&msg, NULL, 0, 0, PM_REMOVE)) {
		if (msg.message == WM_QUIT)
			quit_flag = 1;
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}
}

void plat_present(const uint32_t *fb, int w, int h)
{
	(void)w; (void)h;
	cur_fb = fb;
	InvalidateRect(ghwnd, NULL, TRUE);
	UpdateWindow(ghwnd);
	pump();
}

uint16_t plat_poll(void)
{
	uint16_t p;
	pump();
	p = pad_accum;
	pad_accum = 0;
	return p;
}

int plat_quit_requested(void)
{
	return quit_flag;
}

void plat_shutdown(void)
{
	timeEndPeriod(1);
	if (ghwnd) {
		DestroyWindow(ghwnd);
		ghwnd = NULL;
	}
}
