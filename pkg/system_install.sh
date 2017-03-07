#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install System..."
pacman -S --needed base base-devel namcap zsh gvim \
dialog sudo \
udevil udisks ntfs-3g exfat-utils dosfstools ncdu rsync \
dialog perl-rename bc tree htop sysstat hwinfo acpi acpid openssh wget \
xorg-server xorg-xinit xorg-server-utils xf86-input-synaptics \
xf86-video-nouveau xf86-video-intel \
awesome xlockmore rxvt-unicode rox thunar thunar-archive-plugin file-roller \
lxappearance gtk-engine-murrine gtk-engine-aurora \
gnome-icon-theme gnome-icon-theme-extras \
oxygen-icons oxygen-icons-svg oxygen-gtk2 \
ibus ibus-qt ibus-anthy otf-ipafont ttf-hanazono \
ttf-dejavu ttf-droid ttf-inconsolata ttf-liberation ttf-freefont
echo "install System Done"

