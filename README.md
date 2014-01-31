Config
======

ArchLinux configuration files (zshrc...)
warning no backup are performed !

User config Installation
-------------------------

simply run ./install.sh

Archlinux package config
---------------------

in root run ./pkg_install.sh

Archlinux configuration
-----------------------

cfdisk...
mkfs.ext4...
mount all...
genfstab -L -p /mnt >> /mnt/etc/fstab
archroot arch-chroot /mnt
echo "LANG=\"fr_FR.UTF-8\"" > /etc/locale.conf 
echo "KEYMAP=fr-pc" > /etc/vconsole.conf
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
mkinitcpio -p linux
pacman -S syslinux
syslinux-install_update -iam
# edit /boot/syslinux/syslinux.cfg
systemctl enable wicd
