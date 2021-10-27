#!/usr/bin/env bash
set -e

set -x
rm -rf ~/.vim
rm -f ~/.vimrc

cp vimrc ~/.vimrc

mkdir -p ~/.vim/colors
#cp mouse.vim ~/.vim/colors/

mkdir -p ~/.vim/bundle && \
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Finalize YouCompleteMe install
# see: https://github.com/ycm-core/YouCompleteMe/blob/master/README.md#linux-64-bit
cd ~/.vim/bundle/YouCompleteMe
./install.py --clangd-completer

# Finalize Nodejs install
vim +"CocInstall coc-json coc-tsserver" +qall
