#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install Media..."
pacman -S --needed unrar unzip p7zip \
chromium firefox flashplugin filezilla xchat perl-file-mimeinfo \
smplayer vlc audacious audacious-plugins libcue libmms neon wavpack alsa-utils  \
scrot gimp inkscape feh gcolor2 blender wings3d \
calibre libreoffice zathura zathura-pdf-mupdf zathura-djvu \
nethack wesnoth dwarffortress armagetronad
yaourt -S --needed --noconfirm chromium-pepper-flash
echo "install Media Done"
