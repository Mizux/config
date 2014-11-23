#!/usr/bin/bash

echo "Install VIM..."

echo "Remove old VIM"
rm -rf ~/.vim
rm -f ~/.vimrc

echo "Install VIM config"
cp vimrc ~/.vimrc

echo "Install Vundle"
mkdir -p ~/.vim/bundle && \
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "Compile YouCompleteMe"
$(cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer)

echo "Install VIM...DONE"
