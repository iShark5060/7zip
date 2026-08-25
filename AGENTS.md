# 7-Zip (personal fork)

## Org standards

CI/README/validate conventions live in AppBase `docs/org-standards/` with personal-repo overrides (`personal-repos.md`). GitHub-hosted runners, not Blacksmith. Quality gate: `scripts/validate.ps1` (`nmake PLATFORM=x64` under `CPP/7zip`). Release **Track B**: manual `.github/workflows/release.yml`. GitHub is `iShark5060/7zip`.

## Overview

MSVC Windows builds of 7-Zip with File Manager / GUI dark mode. See `README.md` for clone and nmake examples.

## Dark mode and build

Dark mode is on by default and needs the Git submodule at `CPP/7zip/UI/FileManager/third_party/win32-darkmodelib`. Clone with `--recurse-submodules` (CI uses `submodules: recursive`). Without the submodule, FM/GUI dark builds fail.

Opt out: `nmake Z7_NO_WIN32_DARKMODE=1`. Darkmode objects compile as C++20 with UNICODE and a Win10 floor (`Z7_WIN32_WINNT_MIN=0x0A00`). Do not strip those flags when touching `FM.mak` / `7zip.mak`.

## Validate and release

`scripts/validate.ps1` refuses to start if `LATEST.VER` is missing or `nmake` is not on PATH (MSVC Developer Command Prompt / `iShark5060/actions-msvc-dev-cmd@v1` in CI). There is no push-to-main CI, only `pr.yml` plus manual Track B `release.yml`. Release tags are `X.YY`; empty workflow input reads `LATEST.VER`.
