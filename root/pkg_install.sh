#!/usr/bin/bash

echo "install System..."
pacman -Syu
pacman -S --needed base base-devel udevil ntfs-3g dialog zsh gvim \
perl-rename tree htop hwinfo acpi acpid openssh rsync \
xorg-server xorg-xinit xorg-server-utils mesa \
nvidia nvidia-utils nvidia-libgl \
awesome rxvt-unicode rox \
lxappearance gtk-engine-murrine gtk-aurora-engine oxygen-icons oxygen-icons-svg \
anthy uim otf-ipafont ttf-hanazono \
ttf-dejavu ttf-droid ttf-inconsolata ttf-liberation ttf-freefont
echo "install System Done"

echo "install Dev..."
pacman -S --needed git tk tig aspell-en aspell-fr meld sloccount \
qtcreator clang cmake gdb strace valgrind \
boost bullet openscenegraph \
doxygen graphviz qt qt4 ctags upx \
desmume
echo "install Dev Done"

echo "install Media..."
pacman -S --needed unrar unzip p7zip \
chromium firefox flashplugin filezilla xchat \
smplayer vlc audacious audacious-plugins libcue libmms neon wavpack alsa-utils  \
scrot gimp inkscape feh gcolor2 blender wings3d \
calibre zathura zathura-pdf-mupdf \
nethack wesnoth dwarffortress
echo "install Media Done"
