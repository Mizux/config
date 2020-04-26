#!/usr/bin/env bash
# Must NOT be run as root
set -euxo pipefail

echo "update System..."
sudo pacman -Syu
echo "update System Done"

sudo pacman -S --needed git pacman

sudo rm -rf /tmp/yay

git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si
cd .. && rm -rf yay

echo "update repo..."
yay -Sy
echo "update repo Done"
