#!/usr/bin/env bash
set -euo pipefail

# Cursor cloud environment for the 7-Zip fork.
# The Tailscale and netcat setup matches shark5060/crowdsec-web-ui.
# Official Windows binaries need MSVC (`scripts/validate.ps1`). A Linux cloud
# VM cannot run that gate, so only connectivity tools plus a Unix C/C++
# toolchain are installed for git and limited makefile builds.

if ! command -v tailscaled >/dev/null; then
  . /etc/os-release
  curl -fsSL "https://pkgs.tailscale.com/stable/ubuntu/${VERSION_CODENAME}.noarmor.gpg" | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
  curl -fsSL "https://pkgs.tailscale.com/stable/ubuntu/${VERSION_CODENAME}.tailscale-keyring.list" | sudo tee /etc/apt/sources.list.d/tailscale.list >/dev/null
  sudo apt-get update -qq
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y tailscale
fi

if ! command -v nc >/dev/null; then
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y netcat-openbsd
fi

if ! command -v g++ >/dev/null || ! command -v make >/dev/null; then
  sudo apt-get update -qq
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential make nasm
fi
