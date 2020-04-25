#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install System..."
pacman -S --needed \
base base-devel zsh gvim \
exfat-utils dosfstools \
perl-rename \
tree ncdu rsync \
htop hwinfo \
wget curl \
alsa-utils \
xorg-server xorg-xinit \
awesome rxvt-unicode rox file-roller \
ttf-dejavu ttf-droid ttf-inconsolata ttf-liberation ttf-freefont
echo "install System Done"

exit

# Deprecated
#vim-spell-fr vim-spell-en \
#namcap \
#dialog \
#sudo \
#udevil \
#udisks \
#ntfs-3g  \
#dialog \
#perl-rename \
#bc \
#sysstat \
#acpi acpid \
#openssh \
#wget \

#xorg-server-utils \
#xf86-input-synaptics \
#xf86-video-nouveau \
#xf86-video-intel \

#awesome \
#xlockmore \
#thunar thunar-archive-plugin \
#lxappearance \
#gtk-engine-murrine gtk-engine-aurora \
#gnome-icon-theme gnome-icon-theme-extras \
#oxygen-icons oxygen-icons-svg oxygen-gtk2 \
#ibus ibus-qt ibus-anthy otf-ipafont ttf-hanazono \
