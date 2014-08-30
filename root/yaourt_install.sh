#!/usr/bin/bash

conf="/etc/pacman.conf"
if grep --quiet "archlinuxfr" $conf; then
  echo "archlinux repo already here"
else
  echo "adding archlinux repo"
  printf "\n[archlinuxfr]" >> $conf
  printf "\nSigLevel = Never" >> $conf
  printf "\nServer = http://repo.archlinux.fr/\$arch\n" >> $conf
fi

echo "update repo..."
pacman -Sy
pacman -S --needed yaourt
echo "update repo Done"
