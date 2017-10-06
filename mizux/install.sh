#!/usr/bin/env bash

# /!\ This script won't do backup /!\
set -x
cp zshrc ~/.zshrc

cp gitconfig ~/.gitconfig

cp Xdefaults ~/.Xdefaults
mkdir -pv ~/.urxvt/ext && cp resize-font ~/.urxvt/ext

cp xinitrc ~/.xinitrc
cp xsession ~/.xsession
cp gtkrc-2.0 ~/.gtkrc-2.0

mkdir -pv ~/.config/awesome && cp rc.lua ~/.config/awesome

# Build tools
mkdir -pv ~/.local/bin
cp qc qm qf ~/.local/bin

# Plantuml
mkdir -pv ~/.local/bin
cp plantuml ~/.local/bin
(cd ~/.local/bin && wget https://downloads.sourceforge.net/project/plantuml/plantuml.jar)
