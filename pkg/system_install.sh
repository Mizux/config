#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install System..."
pacman -S --needed \
networkmanager \
bat bat-extras git-delta exa \
base base-devel zsh gvim neovim-qt \
gnupg expect \
exfat-utils dosfstools udisks2 \
perl-rename \
tree ncdu rsync \
neofetch htop hwinfo lshw dmidecode \
wget curl tmux \
alsa-utils
echo "install System Done"

# Xorg server and WM
echo "install Xorg..."
pacman -S --needed \
xorg-server xorg-xinit xterm numlockx xclip \
awesome rxvt-unicode kitty kitty-terminfo \
file-roller \
deepin lxde mate plasma \
gtk-engines gtk-engine-murrine \
oxygen-icons oxygen-icons-svg
echo "install Xorg Done"

# Wayland server and WM
echo "install Wayland..."
pacman -S --needed \
hyprland hyprlock hypridle hyprpaper \
waybar wofi cliphist dolphin
echo "install Wayland Done"

echo "install Fonts..."
pacman -S --needed \
ttf-liberation ttf-croscore \
ttf-dejavu \
gnu-free-fonts ttf-freefont \
ttf-droid ttf-roboto \
noto-fonts noto-fonts-emoji \
ttf-inconsolata ttf-hack \
ipa-fonts ttf-hanazono ttf-sazanami \
nerd-fonts
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
