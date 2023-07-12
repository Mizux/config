#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install Media..."
pacman -S --needed \
unrar unzip p7zip \
chromium firefox youtube-dl \
hexchat \
cmus audacious audacious-plugins \
audacity kid3-qt \
scrot feh gimp xcftools inkscape synfigstudio synfig \
gcolor2 gcolor3 \
smplayer vlc ffmpeg \
blender wings3d \
sweethome3d \
zathura zathura-pdf-mupdf zathura-djvu pdftk \
mcomix mupdf-tools
echo "install Media Done"

echo "install Game..."
pacman -S --needed \
nethack dwarffortress wesnoth \
xonotic minetest \
steam-native-runtime
echo "install Game Done"

exit

# Twitch Streaming
obs-studio

# A multi-system chiptune tracker
furnace

# Deprecated
flashplugin filezilla perl-file-mimeinfo \
smtube libcue libmms neon wavpack  \
krita \
calibre libreoffice evince \
yay -S --needed --noconfirm chromium-pepper-flash

armagetronad \
