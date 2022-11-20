#!/usr/bin/env bash
set -euxo pipefail

# Cleanup
rm -rf "$HOME/.config/code-oss"
rm -rf "$HOME/.config/Code - OSS"
rm -rf "$HOME/.vscode-oss"

# Copy my default settings
mkdir -pv "$HOME/.config/Code - OSS/User/"
cp settings.json "$HOME/.config/Code - OSS/User/"
cp keybindings.json "$HOME/.config/Code - OSS/User/"

# VSX CORS Fixup
# see: https://github.com/VSCodium/vscodium/issues/746#issuecomment-881049046
mkdir -pv "$HOME/.vscode-oss"
cp argv.json "$HOME/.vscode-oss"
