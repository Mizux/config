#!/bin/bash
if [ $# -eq 1 ]; then
  echo "login will be $1 ($1@aldebaran-robotics.com)"
  LOGIN=$1
else
  echo "login will be naogentoo (naogentoo@aldebaran-robotics.com)"
  LOGIN=naogentoo
fi

echo "Warning !\nThis script won't do backup !"

echo "Installing zsh configuration..."
cp zshrc ~/.zshrc
echo "Installing zsh configuration DONE"

echo "Installing vim configuration..."
cp vimrc ~/.vimrc
cp -r vim ~/.vim
echo "Installing vim configuration DONE"

echo "Installing git configuration..."
cp gitconfig ~/.gitconfig
sed "s/naogentoo/${LOGIN}/" -i gitconfig
echo "Installing git configuration DONE"

echo "Installing X configuration..."
cp Xdefaults ~/.Xdefaults
cp gtkrc-2.0 ~/.gtkrc-2.0
echo "Insalling X configuration DONE"

echo "Installing awesome configuration..."
mkdir -pv ~/.config/awesome
cp -r rc.lua ~/.config/awesome/rc.lua
echo "Installing awesome configuration DONE"

echo "Installing aldebaran configuration..."
mkdir -pv ~/.local/bin
cp rlist ~/.local/bin/rlist
pip2 install qibuild --user
pip2 install sphinxcontrib-doxylink --user
echo "Installing aldebaran configuration DONE"
