#!/usr/bin/env bash

# /!\ This script won't do backup /!\
set -euxo pipefail

# Shell
cp zshrc ~/.zshrc

# Git
cp gitconfig ~/.gitconfig

# X11
#cp xinitrc ~/.xinitrc
#cp xsession ~/.xsession
#cp gtkrc-2.0 ~/.gtkrc-2.0

## Awesome WM
mkdir -pv ~/.config/awesome && cp rc.lua ~/.config/awesome

## urxvt
cp Xdefaults ~/.Xdefaults
mkdir -pv ~/.urxvt/ext && cp resize-font ~/.urxvt/ext

# ruby
#gem install jekyll bundler

# Build tools
#mkdir -pv ~/.local/bin
#cp qc qm qf ~/.local/bin

## Plantuml
#mkdir -pv ~/.local/bin
#cp plantuml ~/.local/bin
#(cd ~/.local/bin && wget https://downloads.sourceforge.net/project/plantuml/plantuml.jar)
