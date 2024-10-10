#!/usr/bin/env bash
set -euxo pipefail

# Cleanup
rm -rf "$HOME"/.config/helix

# Install conf
mkdir -p "$HOME"/.config/helix
cp config.toml "$HOME"/.config/helix/
