OBJS = \
  $O\StdAfx.obj \
  $(CURRENT_OBJS) \
  $(COMMON_OBJS) \
  $(WIN_OBJS) \
  $(WIN_CTRL_OBJS) \
  $(7ZIP_COMMON_OBJS) \
  $(UI_COMMON_OBJS) \
  $(AGENT_OBJS) \
  $(CONSOLE_OBJS) \
  $(EXPLORER_OBJS) \
  $(FM_OBJS) \
  $(GUI_OBJS) \
  $(AR_COMMON_OBJS) \
  $(AR_OBJS) \
  $(7Z_OBJS) \
  $(CAB_OBJS) \
  $(CHM_OBJS) \
  $(COM_OBJS) \
  $(ISO_OBJS) \
  $(NSIS_OBJS) \
  $(RAR_OBJS) \
  $(TAR_OBJS) \
  $(UDF_OBJS) \
  $(WIM_OBJS) \
  $(ZIP_OBJS) \
  $(COMPRESS_OBJS) \
  $(CRYPTO_OBJS) \
  $(C_OBJS) \
  $(ASM_OBJS) \
  $(Z7_DARKMODE_OBJS) \
  $O\resource.res \

!include "../../../Build.mak"

!IFDEF Z7_DARKMODE_LINK
# UNICODE/_UNICODE: required so Win32 TCHAR/WC_* macros match darkmodelib (wchar_t / std::wstring).
Z7_DARKMODE_COMPILE=$(CC) $(CFLAGS_O2) /std:c++20 /utf-8 /WX- -DUNICODE -D_UNICODE -I"$(Z7_DARKMODE_ROOT)\include" -I"$(Z7_DARKMODE_ROOT)\src" -D_DARKMODELIB_NO_INI_CONFIG -D_WINDOWS -DSTRICT_TYPED_ITEMIDS -DNOMINMAX -DWIN32_LEAN_AND_MEAN -DVC_EXTRALEAN -DSUPPORT_UTF8
!ENDIF

# MAK_SINGLE_FILE = 1

!IFDEF MAK_SINGLE_FILE

!IFDEF CURRENT_OBJS
$(CURRENT_OBJS): ./$(*B).cpp
	$(COMPL)
!ENDIF


!IFDEF COMMON_OBJS
$(COMMON_OBJS): ../../../Common/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF WIN_OBJS
$(WIN_OBJS): ../../../Windows/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF WIN_CTRL_OBJS
$(WIN_CTRL_OBJS): ../../../Windows/Control/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF 7ZIP_COMMON_OBJS
$(7ZIP_COMMON_OBJS): ../../Common/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF AR_OBJS
$(AR_OBJS): ../../Archive/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF AR_COMMON_OBJS
$(AR_COMMON_OBJS): ../../Archive/Common/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF 7Z_OBJS
$(7Z_OBJS): ../../Archive/7z/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF CAB_OBJS
$(CAB_OBJS): ../../Archive/Cab/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF CHM_OBJS
$(CHM_OBJS): ../../Archive/Chm/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF COM_OBJS
$(COM_OBJS): ../../Archive/Com/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF ISO_OBJS
$(ISO_OBJS): ../../Archive/Iso/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF NSIS_OBJS
$(NSIS_OBJS): ../../Archive/Nsis/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF RAR_OBJS
$(RAR_OBJS): ../../Archive/Rar/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF TAR_OBJS
$(TAR_OBJS): ../../Archive/Tar/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF UDF_OBJS
$(UDF_OBJS): ../../Archive/Udf/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF WIM_OBJS
$(WIM_OBJS): ../../Archive/Wim/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF ZIP_OBJS
$(ZIP_OBJS): ../../Archive/Zip/$(*B).cpp
	$(COMPL) $(ZIP_FLAGS)
!ENDIF

!IFDEF COMPRESS_OBJS
$(COMPRESS_OBJS): ../../Compress/$(*B).cpp
	$(COMPL_O2)
!ENDIF

!IFDEF CRYPTO_OBJS
$(CRYPTO_OBJS): ../../Crypto/$(*B).cpp
	$(COMPL_O2)
!ENDIF

!IFDEF UI_COMMON_OBJS
$(UI_COMMON_OBJS): ../../UI/Common/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF AGENT_OBJS
$(AGENT_OBJS): ../../UI/Agent/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF CONSOLE_OBJS
$(CONSOLE_OBJS): ../../UI/Console/$(*B).cpp
	$(COMPL) $(CONSOLE_VARIANT_FLAGS)
!ENDIF

!IFDEF EXPLORER_OBJS
$(EXPLORER_OBJS): ../../UI/Explorer/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF FM_OBJS
$(FM_OBJS): ../../UI/FileManager/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF GUI_OBJS
$(GUI_OBJS): ../../UI/GUI/$(*B).cpp
	$(COMPL)
!ENDIF

!IFDEF C_OBJS
$(C_OBJS): ../../../../C/$(*B).c
	$(COMPL_O2)
!ENDIF


!ELSE

{.}.cpp{$O}.obj::
	$(COMPLB)
{../../../Common}.cpp{$O}.obj::
	$(COMPLB)
{../../../Windows}.cpp{$O}.obj::
	$(COMPLB)
{../../../Windows/Control}.cpp{$O}.obj::
	$(COMPLB)
{../../Common}.cpp{$O}.obj::
	$(COMPLB)

{../../UI/Common}.cpp{$O}.obj::
	$(COMPLB)
{../../UI/Agent}.cpp{$O}.obj::
	$(COMPLB)
{../../UI/Console}.cpp{$O}.obj::
	$(COMPLB) $(CONSOLE_VARIANT_FLAGS)
{../../UI/Explorer}.cpp{$O}.obj::
	$(COMPLB)
{../../UI/FileManager}.cpp{$O}.obj::
	$(COMPLB)
{../../UI/GUI}.cpp{$O}.obj::
	$(COMPLB)


{../../Archive}.cpp{$O}.obj::
	$(COMPLB)
{../../Archive/Common}.cpp{$O}.obj::
	$(COMPLB)

{../../Archive/7z}.cpp{$O}.obj::
	$(COMPLB)
{../../Archive/Cab}.cpp{$O}.obj::
	$(COMPLB)
{../../Archive/Chm}.cpp{$O}.obj::
	$(COMPLB)
{../../Archive/Com}.cpp{$O}.obj::
	$(COMPLB)
{../../Archive/Iso}.cpp{$O}.obj::
	$(COMPLB)
{../../Archive/Nsis}.cpp{$O}.obj::
	$(COMPLB)
{../../Archive/Rar}.cpp{$O}.obj::
	$(COMPLB)
{../../Archive/Tar}.cpp{$O}.obj::
	$(COMPLB)
{../../Archive/Udf}.cpp{$O}.obj::
	$(COMPLB)
{../../Archive/Wim}.cpp{$O}.obj::
	$(COMPLB)
{../../Archive/Zip}.cpp{$O}.obj::
	$(COMPLB) $(ZIP_FLAGS)

{../../Compress}.cpp{$O}.obj::
	$(COMPLB_O2)
{../../Crypto}.cpp{$O}.obj::
	$(COMPLB_O2)
{../../../../C}.c{$O}.obj::
	$(CCOMPLB)

!ENDIF

!IFDEF Z7_DARKMODE_LINK

$O\DarkModeSubclass.obj: "$(Z7_DARKMODE_ROOT)\src\DarkModeSubclass.cpp"
	$(Z7_DARKMODE_COMPILE) -Fo$@ "$(Z7_DARKMODE_ROOT)\src\DarkModeSubclass.cpp"

$O\DmlibColor.obj: "$(Z7_DARKMODE_ROOT)\src\DmlibColor.cpp"
	$(Z7_DARKMODE_COMPILE) -Fo$@ "$(Z7_DARKMODE_ROOT)\src\DmlibColor.cpp"

$O\DmlibDpi.obj: "$(Z7_DARKMODE_ROOT)\src\DmlibDpi.cpp"
	$(Z7_DARKMODE_COMPILE) -Fo$@ "$(Z7_DARKMODE_ROOT)\src\DmlibDpi.cpp"

$O\DmlibHook.obj: "$(Z7_DARKMODE_ROOT)\src\DmlibHook.cpp"
	$(Z7_DARKMODE_COMPILE) -Fo$@ "$(Z7_DARKMODE_ROOT)\src\DmlibHook.cpp"

$O\DmlibIni.obj: "$(Z7_DARKMODE_ROOT)\src\DmlibIni.cpp"
	$(Z7_DARKMODE_COMPILE) -Fo$@ "$(Z7_DARKMODE_ROOT)\src\DmlibIni.cpp"

$O\DmlibPaintHelper.obj: "$(Z7_DARKMODE_ROOT)\src\DmlibPaintHelper.cpp"
	$(Z7_DARKMODE_COMPILE) -Fo$@ "$(Z7_DARKMODE_ROOT)\src\DmlibPaintHelper.cpp"

$O\DmlibSubclass.obj: "$(Z7_DARKMODE_ROOT)\src\DmlibSubclass.cpp"
	$(Z7_DARKMODE_COMPILE) -Fo$@ "$(Z7_DARKMODE_ROOT)\src\DmlibSubclass.cpp"

$O\DmlibSubclassControl.obj: "$(Z7_DARKMODE_ROOT)\src\DmlibSubclassControl.cpp"
	$(Z7_DARKMODE_COMPILE) -Fo$@ "$(Z7_DARKMODE_ROOT)\src\DmlibSubclassControl.cpp"

$O\DmlibSubclassWindow.obj: "$(Z7_DARKMODE_ROOT)\src\DmlibSubclassWindow.cpp"
	$(Z7_DARKMODE_COMPILE) -Fo$@ "$(Z7_DARKMODE_ROOT)\src\DmlibSubclassWindow.cpp"

$O\DmlibWinApi.obj: "$(Z7_DARKMODE_ROOT)\src\DmlibWinApi.cpp"
	$(Z7_DARKMODE_COMPILE) -Fo$@ "$(Z7_DARKMODE_ROOT)\src\DmlibWinApi.cpp"

!ENDIF

!include "Asm.mak"
