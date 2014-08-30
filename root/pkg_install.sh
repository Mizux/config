#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install System..."
pacman -S --needed base base-devel namcap zsh gvim \
udevil udisks ntfs-3g dosfstools ncdu rsync \
dialog perl-rename bc tree htop hwinfo acpi acpid openssh wget \
xorg-server xorg-xinit xorg-server-utils xf86-input-synaptics mesa \
nvidia nvidia-utils nvidia-libgl \
awesome rxvt-unicode rox thunar thunar-archive-plugin file-roller \
lxappearance gtk-engine-murrine gtk-aurora-engine \
gnome-icon-theme gnome-icon-theme-extras \
oxygen-icons oxygen-icons-svg oxygen-gtk2 oxygen-gtk3 \
anthy uim otf-ipafont ttf-hanazono \
ttf-dejavu ttf-droid ttf-inconsolata ttf-liberation ttf-freefont
echo "install System Done"

echo "install Dev..."
pacman -S --needed git tk tig aspell-en aspell-fr meld sloccount \
qtcreator ipython clang cmake ninja gdb strace valgrind \
boost bullet eigen openscenegraph opencv \
doxygen graphviz qt qt4 ctags upx \
desmume
echo "install Dev Done"

echo "install Python2 dev..."
pacman -S --needed ipython2 python2-pip python2-sphinx python2-numpy python2-matplotlib \
python2-paramiko python2-pytz python2-dateutil \
echo "install Python2 dev Done"

echo "install Media..."
pacman -S --needed unrar unzip p7zip \
chromium firefox flashplugin filezilla xchat perl-file-mimeinfo \
smplayer vlc audacious audacious-plugins libcue libmms neon wavpack alsa-utils  \
scrot gimp inkscape feh gcolor2 blender wings3d \
calibre libreoffice zathura zathura-pdf-mupdf \
nethack wesnoth dwarffortress armagetronad
echo "install Media Done"
