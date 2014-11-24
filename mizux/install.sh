#!/usr/bin/env bash

echo "Warning !\nThis script won't do backup !"

echo "Installing zsh configuration..."
cp zshrc ~/.zshrc
echo "Installing zsh configuration DONE"

echo "Installing git configuration..."
cp gitconfig ~/.gitconfig
echo "Installing git configuration DONE"

echo "Installing X configuration..."
cp Xdefaults ~/.Xdefaults
cp xinitrc ~/.xinitrc
cp xsession ~/.xsession
cp gtkrc-2.0 ~/.gtkrc-2.0
echo "Insalling X configuration DONE"

echo "Installing awesome configuration..."
mkdir -pv ~/.config/awesome
cp -r rc.lua ~/.config/awesome/rc.lua
echo "Installing awesome configuration DONE"
