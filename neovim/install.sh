#!/usr/bin/env bash
set -euxo pipefail

# Cleanup
rm -rf "$HOME"/.config/nvim
rm -rf "$HOME"/.local/share/neovim

# Install conf
mkdir -p "$HOME"/.config/nvim
cp init.vim "$HOME"/.config/nvim/init.vim

# Install plugins
curl -fLo "$HOME"/.local/share/nvim/site/autoload/plug.vim \
 --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall
