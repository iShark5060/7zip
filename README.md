# 7-Zip

[![PR](https://img.shields.io/github/actions/workflow/status/iShark5060/7zip/pr.yml?style=flat-square&label=PR)](https://github.com/iShark5060/7zip/actions/workflows/pr.yml)
![MSVC](https://img.shields.io/badge/MSVC-nmake-5C2D91?logo=visualstudio&logoColor=white&style=flat-square)
![Windows](https://img.shields.io/badge/Windows-x64-0078D6?logo=windows&logoColor=white&style=flat-square)
[![Cursor](https://img.shields.io/badge/Cursor-IDE-141414?logo=cursor&logoColor=white&style=flat-square)](https://cursor.com)

Personal Windows MSVC fork of [7-Zip](https://7-zip.org). Same File Manager, with dark mode. I wanted the archive tool I already use, without the 1990s chrome.

Dark mode uses [win32-darkmodelib](https://github.com/ozone10/darkmodelib) as a Git submodule.

## Building the File Manager (7zFM.exe)

Visual Studio with Desktop development with C++, and the x64 Native Tools command prompt. Clone with submodules:

```bat
git clone --recurse-submodules https://github.com/iShark5060/7zip.git
```

Or after a normal clone: `git submodule update --init --recursive`.

```bat
cd /d D:\Development\7zip\CPP\7zip\Bundles\Fm
nmake
```

Output goes under an `o` folder (or `o64` etc.): `7zFM.exe`.

To build without dark mode: `nmake Z7_NO_WIN32_DARKMODE=1`.

Full-tree Release build (same as CI), from an MSVC-enabled shell at the repo root:

```powershell
pwsh ./scripts/validate.ps1
```

See `CPP\7zip\UI\FileManager\third_party\README.md` for how to update the dark-mode submodule.

## License

See [DOC/License.txt](DOC/License.txt) (upstream 7-Zip license terms).
