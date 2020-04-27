#!/usr/bin/env bash
set -euxo pipefail

# seems to be stored in: $HOME/.config/mimeapps.list
echo "Setup mimetype..."
xdg-mime default gvim.desktop text/plain
xdg-mime default gvim.desktop text/xml
xdg-mime default gvim.desktop text/x-shellscript
xdg-mime default gvim.desktop text/x-c++
xdg-mime default gvim.desktop text/x-java

xdg-mime default chromium.desktop x-scheme-handler/mailto
xdg-mime default chromium.desktop x-scheme-handler/http
xdg-mime default chromium.desktop x-scheme-handler/https
xdg-mime default chromium.desktop x-scheme-handler/about
xdg-mime default chromium.desktop x-scheme-handler/unknown
xdg-mime default chromium.desktop text/html

xdg-mime default audacious.desktop audio/mpeg
xdg-mime default audacious.desktop audio/ogg
xdg-mime default audacious.desktop audio/flac
xdg-mime default audacious.desktop audio/wav

xdg-mime default feh.desktop image/jpg
xdg-mime default feh.desktop image/jpeg
xdg-mime default feh.desktop image/png
xdg-mime default inkscape.desktop image/svg

xdg-mime default smplayer.desktop video/quicktime
xdg-mime default smplayer.desktop video/avi
xdg-mime default smplayer.desktop video/mkv
xdg-mime default smplayer.desktop video/mp4
xdg-mime default smplayer.desktop video/flv

echo "install mimetype Done"

exit
