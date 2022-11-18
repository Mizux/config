#!/usr/bin/env bash
set -euxo pipefail

## Cleanup
#rm -rf "$HOME/.config/code-oss"
#rm -rf "$HOME/.config/Code - OSS"
#rm -rf "$HOME/.vscode-oss"

# Install my extensions
if [ -x "$(command -v codium)" ]; then
  CODE=codium
elif [ -x "$(command -v code)" ]; then
  CODE=code
else
  exit 2
fi


## IDE
$CODE --install-extension alefragnani.Bookmarks
$CODE --install-extension GitHub.github-vscode-theme
$CODE --install-extension PKief.material-icon-theme
$CODE --install-extension vscodevim.vim
### Preview
$CODE --install-extension shd101wyy.markdown-preview-enhanced
$CODE --install-extension jock.svg

## Language
#### Build system
$CODE --install-extension ms-vscode.makefile-tools
$CODE --install-extension ms-vscode.cmake-tools
$CODE --install-extension twxs.cmake

### Proto
$CODE --install-extension zxh404.vscode-proto3

### C++
$CODE --install-extension ms-vscode.cpptools
$CODE --install-extension ms-vscode.cpptools-extension-pack
$CODE --install-extension ms-vscode.cpptools-themes
$CODE --install-extension llvm-vs-code-extensions.vscode-clangd
$CODE --install-extension jeff-hykin.better-cpp-syntax

### Dart / Flutter
$CODE --install-extension Dart-Code.dart-code
$CODE --install-extension Dart-Code.flutter

### Golang
$CODE --install-extension golang.go

### .Net
$CODE --install-extension ms-dotnettools.csharp

### Java
$CODE --install-extension redhat.java
$CODE --install-extension vscjava.vscode-maven

### Python
$CODE --install-extension ms-python.python
$CODE --install-extension ms-python.vscode-pylance

### Web
$CODE --install-extension esbenp.prettier-vscode
$CODE --install-extension ritwickdey.LiveServer

## Tooling
$CODE --install-extension eamodio.gitlens
$CODE --install-extension ms-azuretools.vscode-docker

## Copy my default settings
#mkdir -pv "$HOME/.config/Code - OSS/User/"
#cp settings.json "$HOME/.config/Code - OSS/User/"
#cp keybindings.json "$HOME/.config/Code - OSS/User/"
#
## VSX CORS Fixup
## see: https://github.com/VSCodium/vscodium/issues/746#issuecomment-881049046
#mkdir -pv "$HOME/.vscode-oss"
#cp argv.json "$HOME/.vscode-oss"
