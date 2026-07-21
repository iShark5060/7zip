---
type: Workflow
title: Build and release
description: MSVC nmake builds and manual GitHub Releases.
tags: [workflows, release]
timestamp: 2026-07-21T00:00:00Z
---

# Build and release

Depends on [architecture/overview.md](../architecture/overview.md).

Local File Manager builds often target `CPP/7zip/Bundles/Fm` with `nmake`. Full release builds use `nmake PLATFORM=x64` under `CPP/7zip` as in `.github/workflows/release.yml`.

PR/CI: [operations/ci.md](../operations/ci.md).
