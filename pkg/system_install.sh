#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install System..."
pacman -S --needed \
base base-devel zsh gvim \
exfat-utils dosfstools udisks2 \
perl-rename \
tree ncdu rsync \
htop hwinfo \
wget curl \
alsa-utils
echo "install System Done"

# Xorg server and WM
echo "install Xorg..."
pacman -S --needed \
xorg-server xorg-xinit xterm \
awesome rxvt-unicode rox file-roller \
lxappearance \
gtk-engines gtk-engine-murrine \
gnome-icon-theme gnome-icon-theme-extras \
oxygen-icons oxygen-icons-svg oxygen-gtk2 \
ttf-dejavu ttf-droid ttf-inconsolata ttf-liberation ttf-freefont
echo "install Xorg Done"

# Vulkan
echo "install Vulkan..."
pacman -S --needed \
vulkan-devel vulkan-intel vulkan-icd-loader
echo "install Vulkan Done"

exit

# Deprecated
vim-spell-fr vim-spell-en \
namcap \
dialog \
sudo \
udevil \
ntfs-3g  \
bc \
sysstat \
acpi acpid \
openssh \

xorg-server-utils \
xf86-input-synaptics \
xf86-video-nouveau \
xf86-video-intel \
mesa-demos \

xlockmore \
thunar thunar-archive-plugin \


# Japanese Input Support
ibus ibus-qt ibus-anthy otf-ipafont ttf-hanazono \
