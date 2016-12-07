#!/usr/bin/env bash

echo -e "/!\ Warning /!\ This script won't do backup !"

set -x
cp zshrc ~/.zshrc

cp gitconfig ~/.gitconfig

cp Xdefaults ~/.Xdefaults
cp xinitrc ~/.xinitrc
cp xsession ~/.xsession
cp gtkrc-2.0 ~/.gtkrc-2.0

mkdir -pv ~/.config/awesome
cp -r rc.lua ~/.config/awesome/rc.lua

mkdir -pv ~/.local/bin
cp bgc bgm bcc bcm bcf ~/.local/bin
