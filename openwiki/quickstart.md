---
type: Quickstart
title: 7-Zip fork quickstart
description: Entry point for agents working on the personal 7-Zip MSVC fork.
tags: [quickstart]
timestamp: 2026-07-21T00:00:00Z
---

# 7-Zip fork quickstart

Personal Windows MSVC build of 7-Zip, including dark-mode File Manager via the `win32-darkmodelib` submodule.

## Stack

- C / C++ MSVC (`nmake` under `CPP/7zip`)
- Submodule: `CPP/7zip/UI/FileManager/third_party/win32-darkmodelib`
- Release track B: `.github/workflows/release.yml`
- Validate: `scripts/validate.ps1` (needs MSVC / Dev Cmd)

## Layout

| Path | Role |
| ---- | ---- |
| [architecture/overview.md](architecture/overview.md) | Source tree and dark-mode submodule |
| [workflows/build-release.md](workflows/build-release.md) | Local nmake and GitHub release |
| [operations/ci.md](operations/ci.md) | PR/CI on `windows-latest` |

## Commands

Clone with submodules, open **x64 Native Tools**, then:

```bat
cd CPP\7zip
nmake PLATFORM=x64
```

Or from repo root after MSVC is on PATH: `pwsh ./scripts/validate.ps1`.
