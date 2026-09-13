# 7-Zip

[![PR](https://img.shields.io/github/actions/workflow/status/iShark5060/7zip/pr.yml?style=flat-square&label=PR)](https://github.com/iShark5060/7zip/actions/workflows/pr.yml)
![MSVC](https://img.shields.io/badge/MSVC-nmake-5C2D91?logo=visualstudio&logoColor=white&style=flat-square)
![Windows](https://img.shields.io/badge/Windows-x64-0078D6?logo=windows&logoColor=white&style=flat-square)
[![Cursor](https://img.shields.io/badge/Cursor-IDE-141414?logo=cursor&logoColor=white&style=flat-square)](https://cursor.com)

Personal Windows MSVC fork of [7-Zip](https://7-zip.org). Same File Manager, with dark mode. I wanted the archive tool I already use, without the 1990s chrome.

Dark mode uses [win32-darkmodelib](https://github.com/ozone10/darkmodelib) as a Git submodule.

## Building

Visual Studio with Desktop development with C++. A normal PowerShell window is enough. `build-windows.ps1` finds `nmake`, inits the dark-mode submodule if needed, and copies the binaries into one folder.

```powershell
git clone --recurse-submodules https://github.com/iShark5060/7zip.git
cd 7zip
.\build-windows.ps1
```

That drops `7z.dll`, `7z.exe`, `7zG.exe`, and `7zFM.exe` in `bin\windows-x64`. Useful flags: `-Clean`, `-Platform x64|x86|arm64`, `-OutputDir D:\dist\7zip`.

If you already have an x64 Native Tools prompt and only want File Manager:

```bat
cd CPP\7zip\Bundles\Fm
nmake
```

Output goes under an `o` folder (or `o64`): `7zFM.exe`. Without dark mode: `nmake Z7_NO_WIN32_DARKMODE=1`.

`scripts/validate.ps1` is the CI gate (`nmake PLATFORM=x64` under `CPP/7zip`). It needs an MSVC prompt. See `CPP\7zip\UI\FileManager\third_party\README.md` to update the dark-mode submodule.

## License

See [DOC/License.txt](DOC/License.txt) (upstream 7-Zip license terms).
