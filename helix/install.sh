#!/usr/bin/env bash
set -euxo pipefail

# Cleanup
rm -rf "$HOME"/.config/helix

# Install conf
mkdir -p "$HOME"/.config/helix
cp config.toml "$HOME"/.config/helix/

cp languages.toml "$HOME"/.config/helix/
cp -r themes "$HOME"/.config/helix/
