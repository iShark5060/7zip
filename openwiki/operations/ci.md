---
type: Operations
title: CI and PR checks
description: Windows validate with MSVC Dev Cmd on GitHub-hosted runners.
tags: [operations, ci]
timestamp: 2026-07-29T08:20:00Z
---

# CI and PR checks

- `pr.yml` — `windows-latest`, submodule checkout, `iShark5060/actions-msvc-dev-cmd@v1`, `scripts/validate.ps1`
- `release.yml` — Track B manual release; Windows job builds, attests, and publishes (no Actions artifact handoff)

No push-to-main CI workflow and no Blacksmith runners.
