#!/bin/bash

echo "Warning !\nThis script won't do backup !"

echo "Installing zsh configuration..."
cp zshrc ~/.zshrc
echo "Installing zsh configuration DONE"

echo "Installing vim configuration..."
cp vimrc ~/.vimrc
cp -r vim ~/.vim
echo "Installing vim configuration DONE"

echo "Installing aldebaran configuration..."
mkdir -pv ~/.local/bin
cp rlist ~/.local/bin/rlist
echo "Installing aldebaran configuration DONE"
