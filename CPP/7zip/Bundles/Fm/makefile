PROG = 7zFM.exe

# CFLAGS = $(CFLAGS) -DZ7_LARGE_PAGES

!include "../Format7zF/Arc.mak"

!include "../../UI/FileManager/FM.mak"

COMMON_OBJS = $(COMMON_OBJS) \
  $O\CommandLineParser.obj \
  $O\Lang.obj \
  $O\ListFileUtils.obj \
  $O\Random.obj \

WIN_OBJS = $(WIN_OBJS) \
  $O\Clipboard.obj \
  $O\CommonDialog.obj \
  $O\DLL.obj \
  $O\ErrorMsg.obj \
  $O\FileLink.obj \
  $O\MemoryGlobal.obj \
  $O\MemoryLock.obj \
  $O\Menu.obj \
  $O\ProcessUtils.obj \
  $O\Registry.obj \
  $O\ResourceString.obj \
  $O\SystemInfo.obj \
  $O\Shell.obj \
  $O\Window.obj \

WIN_CTRL_OBJS = \
  $O\ComboBox.obj \
  $O\Dialog.obj \
  $O\ListView.obj \
  $O\PropertyPage.obj \
  $O\Window2.obj \

7ZIP_COMMON_OBJS = $(7ZIP_COMMON_OBJS) \
  $O\FilePathAutoRename.obj \
  $O\FileStreams.obj \
  $O\MultiOutStream.obj \

UI_COMMON_OBJS = \
  $O\ArchiveExtractCallback.obj \
  $O\ArchiveName.obj \
  $O\ArchiveOpenCallback.obj \
  $O\Bench.obj \
  $O\CompressCall2.obj \
  $O\DefaultName.obj \
  $O\EnumDirItems.obj \
  $O\Extract.obj \
  $O\ExtractingFilePath.obj \
  $O\HashCalc.obj \
  $O\LoadCodecs.obj \
  $O\OpenArchive.obj \
  $O\PropIDUtils.obj \
  $O\SetProperties.obj \
  $O\SortUtils.obj \
  $O\TempFiles.obj \
  $O\Update.obj \
  $O\UpdateAction.obj \
  $O\UpdateCallback.obj \
  $O\UpdatePair.obj \
  $O\UpdateProduce.obj \
  $O\WorkDir.obj \
  $O\ZipRegistry.obj \

EXPLORER_OBJS = \
  $O\ContextMenu.obj \
  $O\MyMessages.obj \
  $O\RegistryContextMenu.obj \

GUI_OBJS = \
  $O\BenchmarkDialog.obj \
  $O\CompressDialog.obj \
  $O\ExtractDialog.obj \
  $O\ExtractGUI.obj \
  $O\HashGUI.obj \
  $O\UpdateCallbackGUI.obj \
  $O\UpdateCallbackGUI2.obj \
  $O\UpdateGUI.obj \


# Omit Build.mak default $O\resource.res rule: it uses $** and would pass every prerequisite to rc.exe.
NO_DEFAULT_RES=1

!include "../../7zip.mak"

# Extra deps so toolbar bitmap / icon edits invalidate resource.res; only resource.rc is passed to rc.
FM_RES_FILE_DEPS = \
  ..\..\UI\FileManager\FM.ico \
  ..\..\UI\FileManager\Add.bmp \
  ..\..\UI\FileManager\Add2.bmp \
  ..\..\UI\FileManager\Extract.bmp \
  ..\..\UI\FileManager\Extract2.bmp \
  ..\..\UI\FileManager\Test.bmp \
  ..\..\UI\FileManager\Test2.bmp \
  ..\..\UI\FileManager\Copy.bmp \
  ..\..\UI\FileManager\Copy2.bmp \
  ..\..\UI\FileManager\Move.bmp \
  ..\..\UI\FileManager\Move2.bmp \
  ..\..\UI\FileManager\Delete.bmp \
  ..\..\UI\FileManager\Delete2.bmp \
  ..\..\UI\FileManager\Info.bmp \
  ..\..\UI\FileManager\Info2.bmp

$O\resource.res: resource.rc ..\..\UI\FileManager\resource.rc $(FM_RES_FILE_DEPS)
	rc $(RFLAGS) -fo$@ resource.rc
