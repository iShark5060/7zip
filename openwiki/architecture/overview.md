---
type: Architecture Overview
title: 7-Zip source layout
description: Upstream 7-Zip tree and dark-mode File Manager submodule.
tags: [architecture]
timestamp: 2026-07-21T00:00:00Z
---

# 7-Zip source layout

Classic 7-Zip layout: `C/` (C codecs), `CPP/7zip` (apps/bundles), `DOC/`. Dark mode for the File Manager depends on the Git submodule at `CPP/7zip/UI/FileManager/third_party/win32-darkmodelib` — always clone with `--recurse-submodules` or `git submodule update --init --recursive`.
