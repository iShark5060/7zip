// Z7DarkMode.h -- Windows 11 / dark theme integration for 7-Zip File Manager

#ifndef ZIP7_INC_Z7_DARK_MODE_H
#define ZIP7_INC_Z7_DARK_MODE_H

#include "../../../Common/MyWindows.h"

#if defined(Z7_WIN_DARKMODE_FM) && defined(_WIN32) && !defined(UNDER_CE)

void Z7DarkMode_Init();
void Z7DarkMode_ApplyMainWindow(HWND hwnd);
bool Z7DarkMode_OnSettingChange(HWND hwnd, LPARAM lParam);
void Z7DarkMode_ApplyDialog(HWND hwnd);
void Z7DarkMode_ApplyPropertySheet(HWND hwnd);

#else

static inline void Z7DarkMode_Init() {}
static inline void Z7DarkMode_ApplyMainWindow(HWND) {}
static inline bool Z7DarkMode_OnSettingChange(HWND, LPARAM) { return false; }
static inline void Z7DarkMode_ApplyDialog(HWND) {}
static inline void Z7DarkMode_ApplyPropertySheet(HWND) {}

#endif

#endif
