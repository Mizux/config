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
audacity kid3-qt \
scrot feh gimp xcftools inkscape synfigstudio synfig \
gcolor2 gcolor3 \
smplayer vlc ffmpeg \
blender wings3d goxel \
zathura zathura-pdf-mupdf zathura-djvu pdftk \
calibre mcomix mupdf-tools
echo "install Media Done"

echo "install Game..."
pacman -S --needed \
nethack dwarffortress wesnoth \
xonotic minetest \
steam-native-runtime
# dopewars armagetronad
echo "install Game Done"

exit

# Twitch Streaming
# shellcheck disable=SC2317
obs-studio

# A multi-system chiptune tracker
# shellcheck disable=SC2317
furnace

# Deprecated
# shellcheck disable=SC2317
flashplugin filezilla perl-file-mimeinfo \
smtube libcue libmms neon wavpack  \
sweethome3d \
krita \
libreoffice evince \
yay -S --needed --noconfirm chromium-pepper-flash

