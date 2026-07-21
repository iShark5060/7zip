# 7-Zip

[![CI](https://github.com/iShark5060/7zip/actions/workflows/ci.yml/badge.svg)](https://github.com/iShark5060/7zip/actions/workflows/ci.yml)
[![PR](https://github.com/iShark5060/7zip/actions/workflows/pr.yml/badge.svg)](https://github.com/iShark5060/7zip/actions/workflows/pr.yml)
![MSVC](https://img.shields.io/badge/MSVC-nmake-5C2D91?logo=visualstudio&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-x64-0078D6?logo=windows&logoColor=white)
[![Cursor](https://img.shields.io/badge/Cursor-IDE-141414?logo=cursor&logoColor=white)](https://cursor.com)

Personal Windows MSVC fork of [7-Zip](https://7-zip.org) with dark-mode File Manager support.

## Requirements

- Visual Studio with “Desktop development with C++”
- x64 Native Tools / MSVC Developer Command Prompt
- Git submodules initialized (`win32-darkmodelib`)

## Quick start

1. Clone with submodules: `git clone --recurse-submodules https://github.com/iShark5060/7zip.git`
2. Open **x64 Native Tools Command Prompt for VS**.
3. Build the File Manager bundle:

   ```bat
   cd /d D:\Development\7zip\CPP\7zip\Bundles\Fm
   nmake
   ```

   Output goes under an `o` folder (or `o64` etc.): `7zFM.exe`.

Optional: to build **without** dark mode, run `nmake Z7_NO_WIN32_DARKMODE=1`.

Full-tree Release build (same as CI):

```powershell
# From an MSVC-enabled shell at the repo root
pwsh ./scripts/validate.ps1
```

## Scripts

| Script                 | Description                                         |
| ---------------------- | --------------------------------------------------- |
| `scripts/validate.ps1` | `nmake PLATFORM=x64` under `CPP/7zip` (needs MSVC). |

## Building the File Manager (7zFM.exe)

Prerequisites: **Visual Studio** with “Desktop development with C++”, and the **x64 Native Tools** command prompt.

**Submodule:** dark mode uses [win32-darkmodelib](https://github.com/ozone10/darkmodelib) as a Git submodule at `CPP\7zip\UI\FileManager\third_party\win32-darkmodelib`. Clone with `git clone --recurse-submodules`, or after a normal clone run `git submodule update --init --recursive`. See `CPP\7zip\UI\FileManager\third_party\README.md` for how to update that dependency.

## Development

Agent-oriented docs: [openwiki/quickstart.md](openwiki/quickstart.md).

Engineering standards: AppBase `docs/org-standards/` with [personal-repos.md](https://github.com/Dark-Avian-Labs/AppBase/blob/main/docs/org-standards/personal-repos.md) (GitHub-hosted runners).

## License

See [DOC/License.txt](DOC/License.txt) (upstream 7-Zip license terms).
