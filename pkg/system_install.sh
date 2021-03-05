#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install System..."
pacman -S --needed \
networkmanager \
base base-devel zsh gvim \
exfat-utils dosfstools udisks2 \
perl-rename \
tree ncdu rsync \
htop hwinfo lshw dmidecode \
wget curl \
alsa-utils
echo "install System Done"

# Xorg server and WM
echo "install Xorg..."
pacman -S --needed \
xorg-server xorg-xinit xterm numlockx \
awesome rxvt-unicode rox file-roller \
breeze-gtk breeze-icons \
lxappearance \
gtk-engines gtk-engine-murrine \
gnome-icon-theme gnome-icon-theme-extras \
oxygen-icons oxygen-icons-svg oxygen-gtk2
echo "install Xorg Done"

echo "install Fonts..."
pacman -S --needed \
ttf-liberation ttf-croscore \
ttf-dejavu \
gnu-free-fonts ttf-freefont \
ttf-droid ttf-roboto \
noto-fonts noto-fonts-emoji \
ttf-inconsolata ttf-hack \
ipa-fonts ttf-hanazono ttf-sazanami
echo "install Fonts Done"

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
xf86-video-fbdev \
xf86-video-vesa \

xlockmore \
thunar thunar-archive-plugin \

plasma \
cinnamon \
gnome \
xfce4 \

# Japanese Input Support
# ibus-qt depend on aur qt4...
pacman -S --needed \
ibus ibus-anthy otf-ipafont ttf-hanazononadobe-source-han-sans-jp-fonts \

ibus-setup
