#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install Media..."
pacman -S --needed \
unrar unzip p7zip \
chromium firefox yt-dlp \
hexchat \
cmus audacious audacious-plugins \
audacity kid3-qt furnace \
scrot feh gimp krita xcftools inkscape synfigstudio synfig \
gcolor3 \
smplayer vlc ffmpeg \
blender goxel \
zathura zathura-pdf-mupdf zathura-djvu pdftk \
calibre mupdf-tools
echo "install Media Done"

echo "install Game..."
pacman -S --needed \
nethack dwarffortress wesnoth \
xonotic minetest steam \
# dopewars armagetronad
echo "install Game Done"

exit

################################
# A multi-system chiptune tracker
# shellcheck disable=SC2317
pacman -S --needed \
furnace

# Minecraft
# shellcheck disable=SC2317
pacman -S --needed \
amulet-map-editor

# aur
# shellcheck disable=SC2317
pacman -S --needed \
wings3d mcomix

# Twitch Streaming
# shellcheck disable=SC2317
pacman -S --needed \
obs-studio

# Deprecated
# shellcheck disable=SC2317
pacman -S --needed \
flashplugin filezilla perl-file-mimeinfo \
smtube libcue libmms neon wavpack  \
sweethome3d \
libreoffice evince

# shellcheck disable=SC2317
yay -S --needed --noconfirm chromium-pepper-flash

