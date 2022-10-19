#!/usr/bin/env bash
set -euxo pipefail

# Cleanup
rm -rf "$HOME/.config/code-oss"
rm -rf "$HOME/.config/Code - OSS"
rm -rf "$HOME/.vscode-oss"

# Install my extensions

## IDE
code --install-extension alefragnani.Bookmarks
code --install-extension GitHub.github-vscode-theme
code --install-extension PKief.material-icon-theme
code --install-extension vscodevim.vim
code --install-extension eamodio.gitlens

## Language
code --install-extension esbenp.prettier-vscode

### C++
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension ms-vscode.cpptools-themes
code --install-extension ms-vscode.cmake-tools
code --install-extension twxs.cmake
code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension jeff-hykin.better-cpp-syntax

### Dart / Flutter
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter

### Golang
code --install-extension golang.go

### Java
code --install-extension redhat.java

### Python
code --install-extension ms-python.python

### Web
code --install-extension ritwickdey.LiveServer
code --install-extension ms-azuretools.vscode-docker

# Copy my default settings
mkdir -pv "$HOME/.config/Code - OSS/User/"
cp settings.json "$HOME/.config/Code - OSS/User/"
cp keybindings.json "$HOME/.config/Code - OSS/User/"

# VSX CORS Fixup
# see: https://github.com/VSCodium/vscodium/issues/746#issuecomment-881049046
mkdir -pv "$HOME/.vscode-oss"
cp argv.json "$HOME/.vscode-oss"
