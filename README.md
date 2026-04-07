# 7-Zip on GitHub
7-Zip website: [7-zip.org](https://7-zip.org)

## Building the File Manager (7zFM.exe) on Windows with MSVC

Prerequisites: **Visual Studio** with “Desktop development with C++”, and the **x64 Native Tools** (or “x64_x86 Cross Tools” if you need 32-bit) command prompt.

1. Open **x64 Native Tools Command Prompt for VS** (from the Start menu: search for “x64 Native Tools”).
2. Change to the File Manager bundle directory (adjust the drive/path if your clone lives elsewhere):

   ```bat
   cd /d D:\Development\7zip\CPP\7zip\Bundles\Fm
   ```

3. Run the build (release, x64):

   ```bat
   nmake
   ```

   Output goes under an `o` folder (or `o64` etc., depending on your setup): `7zFM.exe`.

Optional: to build **without** dark mode, run `nmake Z7_NO_WIN32_DARKMODE=1`.

**Submodule:** dark mode uses [win32-darkmodelib](https://github.com/ozone10/darkmodelib) as a Git submodule at `CPP\7zip\UI\FileManager\third_party\win32-darkmodelib`. Clone with `git clone --recurse-submodules`, or after a normal clone run `git submodule update --init --recursive`. See `CPP\7zip\UI\FileManager\third_party\README.md` for how to update that dependency.
