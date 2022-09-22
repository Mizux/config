#!/usr/bin/env bash
set -euxo pipefail

# Cleanup
rm -rf "$HOME"/.vim
rm -f "$HOME"/.vimrc

# Install conf
cp vimrc "$HOME"/.vimrc
mkdir -p "$HOME"/.vim/colors
#cp mouse.vim "$HOME"/.vim/colors/

# Install plugins
mkdir -p "$HOME"/.vim/bundle && \
git clone https://github.com/gmarik/Vundle.vim.git "$HOME"/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Finalize YouCompleteMe install
# see: https://github.com/ycm-core/YouCompleteMe/blob/master/README.md#linux-64-bit
cd "$HOME"/.vim/bundle/YouCompleteMe
./install.py --clangd-completer

# Finalize Nodejs install
vim +"CocInstall coc-json coc-tsserver" +qall
