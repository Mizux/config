#!/usr/bin/env bash
set -euxo pipefail

# Cleanup
rm -rf "$HOME/.config/code-oss"
rm -rf "$HOME/.config/Code - OSS"
rm -rf "$HOME/.vscode-oss"

# Install my extensions
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
code --install-extension esbenp.prettier-vscode
code --install-extension GitHub.github-vscode-theme
code --install-extension golang.go
code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension ms-vscode.cmake-tools
code --install-extension PKief.material-icon-theme
code --install-extension redhat.java
code --install-extension twxs.cmake
code --install-extension vscodevim.vim

# Copy my default settings
mkdir -pv "$HOME/.config/Code - OSS/User/"
cp settings.json "$HOME/.config/Code - OSS/User/"

# VSX CORS Fixup
# see: https://github.com/VSCodium/vscodium/issues/746#issuecomment-881049046
mkdir -pv "$HOME/.vscode-oss"
cp argv.json "$HOME/.vscode-oss"
