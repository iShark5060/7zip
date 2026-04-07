CFLAGS = $(CFLAGS) \
  -DZ7_LANG \

!IFDEF UNDER_CE
LIBS = $(LIBS) ceshell.lib Commctrl.lib
!ELSE
LIBS = $(LIBS) comctl32.lib htmlhelp.lib comdlg32.lib Mpr.lib Gdi32.lib
CFLAGS = $(CFLAGS) -DZ7_DEVICE_FILE
# -DZ7_LONG_PATH
LFLAGS = $(LFLAGS) /DELAYLOAD:mpr.dll
LIBS = $(LIBS) delayimp.lib
!ENDIF

FM_OBJS = \
  $O\App.obj \
  $O\BrowseDialog.obj \
  $O\BrowseDialog2.obj \
  $O\ClassDefs.obj \
  $O\EnumFormatEtc.obj \
  $O\ExtractCallback.obj \
  $O\FileFolderPluginOpen.obj \
  $O\FilePlugins.obj \
  $O\FM.obj \
  $O\FoldersPage.obj \
  $O\FormatUtils.obj \
  $O\FSFolder.obj \
  $O\FSFolderCopy.obj \
  $O\HelpUtils.obj \
  $O\LangUtils.obj \
  $O\MemDialog.obj \
  $O\MenuPage.obj \
  $O\MyLoadMenu.obj \
  $O\OpenCallback.obj \
  $O\OptionsDialog.obj \
  $O\Panel.obj \
  $O\PanelCopy.obj \
  $O\PanelCrc.obj \
  $O\PanelDrag.obj \
  $O\PanelFolderChange.obj \
  $O\PanelItemOpen.obj \
  $O\PanelItems.obj \
  $O\PanelKey.obj \
  $O\PanelListNotify.obj \
  $O\PanelMenu.obj \
  $O\PanelOperations.obj \
  $O\PanelSelect.obj \
  $O\PanelSort.obj \
  $O\PanelSplitFile.obj \
  $O\ProgramLocation.obj \
  $O\PropertyName.obj \
  $O\RegistryAssociations.obj \
  $O\RegistryUtils.obj \
  $O\RootFolder.obj \
  $O\SplitUtils.obj \
  $O\StringUtils.obj \
  $O\SysIconUtils.obj \
  $O\TextPairs.obj \
  $O\UpdateCallback100.obj \
  $O\ViewSettings.obj \
  $O\AboutDialog.obj \
  $O\ComboDialog.obj \
  $O\CopyDialog.obj \
  $O\EditDialog.obj \
  $O\EditPage.obj \
  $O\LangPage.obj \
  $O\ListViewDialog.obj \
  $O\MessagesDialog.obj \
  $O\OverwriteDialog.obj \
  $O\PasswordDialog.obj \
  $O\ProgressDialog2.obj \
  $O\SettingsPage.obj \
  $O\SplitDialog.obj \
  $O\SystemPage.obj \
  $O\VerCtrl.obj \

!IFNDEF UNDER_CE

FM_OBJS = $(FM_OBJS) \
  $O\AltStreamsFolder.obj \
  $O\FSDrives.obj \
  $O\LinkDialog.obj \
  $O\NetFolder.obj \

WIN_OBJS = $(WIN_OBJS) \
  $O\FileSystem.obj \
  $O\Net.obj \
  $O\SecurityUtils.obj \

!ENDIF

C_OBJS = $(C_OBJS) \
  $O\DllSecur.obj \

AGENT_OBJS = \
  $O\Agent.obj \
  $O\AgentOut.obj \
  $O\AgentProxy.obj \
  $O\ArchiveFolder.obj \
  $O\ArchiveFolderOpen.obj \
  $O\ArchiveFolderOut.obj \
  $O\UpdateCallbackAgent.obj \

!IFNDEF UNDER_CE
!IF "$(Z7_NO_WIN32_DARKMODE)" == ""
# win32-darkmodelib vendored under UI/FileManager/third_party (override: nmake Z7_DARKMODE_ROOT=path)
!IFNDEF Z7_DARKMODE_ROOT
Z7_DARKMODE_ROOT = ..\..\UI\FileManager\third_party\win32-darkmodelib
!ENDIF
FM_OBJS = $(FM_OBJS) $O\Z7DarkMode.obj
Z7_DARKMODE_LINK = 1
CFLAGS = $(CFLAGS) -DZ7_WIN_DARKMODE_FM=1 -DZ7_WIN32_WINNT_MIN=0x0A00 -I"$(Z7_DARKMODE_ROOT)\include"
LIBS = $(LIBS) dwmapi.lib UxTheme.lib Shlwapi.lib
Z7_DARKMODE_OBJS = \
  $O\DarkModeSubclass.obj \
  $O\DmlibColor.obj \
  $O\DmlibDpi.obj \
  $O\DmlibHook.obj \
  $O\DmlibIni.obj \
  $O\DmlibPaintHelper.obj \
  $O\DmlibSubclass.obj \
  $O\DmlibSubclassControl.obj \
  $O\DmlibSubclassWindow.obj \
  $O\DmlibWinApi.obj \
!ENDIF
!ENDIF

# we need empty line after last line above
