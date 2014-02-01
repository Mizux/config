#!/usr/bin/bash

echo "install System..."
pacman -Sy --needed base base-devel dialog acpid zsh gvim \
perl-rename tree htop hwinfo acpi alsa-utils \
xorg-server xorg-xinit xorg-server-utils mesa \
nvidia nvidia-utils nvidia-libgl \
awesome rxvt-unicode \
lxappearance gtk-engine-murrine oxygen-icons oxygen-icons-svg \
anthy uim otf-ipafont ttf-hanazono \
ttf-dejavu ttf-droid ttf-inconsolata ttf-liberation ttf-freefont
echo "install System Done"

echo "install Dev..."
pacman -Sy --needed git tk aspell-en aspell-fr meld sloccount \
qtcreator clang cmake gdb strace valgrind \
boost bullet openscenegraph \
doxygen graphviz qt qt4 ctags upx \
desmume
echo "install Dev Done"

echo "install Media..."
pacman -Sy --needed unrar unzip p7zip \
chromium firefox flashplugin filezilla xchat \
smplayer audacious audacious-plugins \
scrot gimp inkscape feh gcolor2 blender wings3d \
calibre zathura zathura-pdf-mupdf \
nethack wesnoth
echo "install Media Done"
