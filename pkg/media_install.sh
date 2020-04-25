#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install Media..."
pacman -S --needed \
unrar unzip p7zip \
chromium firefox youtube-dl \
hexchat \
audacious audacious-plugins audacity \
scrot feh gimp inkscape gcolor2 \
smplayer vlc ffmpeg \
blender wings3d \
zathura zathura-pdf-mupdf zathura-djvu pdftk
echo "install Media Done"

echo "install Game..."
pacman -S --needed \
nethack dwarffortress wesnoth \
xonotic minetest
echo "install Game Done"

exit

# Deprecated
flashplugin filezilla perl-file-mimeinfo \
smtube libcue libmms neon wavpack  \
krita \
calibre libreoffice evince \
yaourt -S --needed --noconfirm chromium-pepper-flash

armagetronad \
