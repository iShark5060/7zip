// Z7DarkMode.cpp -- win32-darkmodelib glue for 7-Zip File Manager

#include "StdAfx.h"

#include "Z7DarkMode.h"

#if defined(Z7_WIN_DARKMODE_FM) && defined(_WIN32) && !defined(UNDER_CE)

#include <DarkModeSubclass.h>

namespace {

// darkmodelib default list background is kDarkColorsView #293134 (slight green/cyan cast).
// Use a neutral blue-grey surface closer to common "dark UI" grays.
void Z7_ApplyListSurfaceColors()
{
  if (!DarkMode::isThemeDark())
    return;
  DarkMode::setViewBackgroundColor(RGB(0x2A, 0x2C, 0x31));
  DarkMode::setViewGridlinesColor(RGB(0x3E, 0x40, 0x45));
  DarkMode::setHeaderBackgroundColor(RGB(0x24, 0x26, 0x2A));
  DarkMode::updateViewBrushesAndPens();
  DarkMode::setSysColor(COLOR_BTNFACE, DarkMode::getViewGridlinesColor());
}

} // namespace

void Z7DarkMode_Init()
{
  DarkMode::initDarkMode();
  Z7_ApplyListSurfaceColors();
}

void Z7DarkMode_ApplyMainWindow(HWND hWnd)
{
  if (hWnd == nullptr)
    return;
  DarkMode::setDarkWndNotifySafeEx(hWnd, false, true);
  DarkMode::setWindowEraseBgSubclass(hWnd);
  DarkMode::setWindowMenuBarSubclass(hWnd);
}

bool Z7DarkMode_OnSettingChange(HWND hWnd, LPARAM lParam)
{
  if (hWnd == nullptr)
    return false;
  if (!DarkMode::handleSettingChange(lParam))
    return false;
  Z7_ApplyListSurfaceColors();
  DarkMode::setDarkTitleBarEx(hWnd, true);
  DarkMode::setChildCtrlsTheme(hWnd);
  DarkMode::setWindowEraseBgSubclass(hWnd);
  DarkMode::setWindowMenuBarSubclass(hWnd);
  ::RedrawWindow(hWnd, nullptr, nullptr,
      RDW_INVALIDATE | RDW_ERASE | RDW_ALLCHILDREN | RDW_UPDATENOW | RDW_FRAME);
  return true;
}

void Z7DarkMode_ApplyDialog(HWND hWnd)
{
  if (hWnd == nullptr)
    return;
  if (!DarkMode::isAtLeastWindows10())
    return;
  DarkMode::setDarkWndNotifySafe(hWnd);
}

void Z7DarkMode_ApplyPropertySheet(HWND hWnd)
{
  if (hWnd == nullptr)
    return;
  if (!DarkMode::isAtLeastWindows10())
    return;
  DarkMode::setDarkWndNotifySafe(hWnd);
  DarkMode::setWindowEraseBgSubclass(hWnd);
}

#endif
