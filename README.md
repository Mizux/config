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
edit /etc/locale.gen (fr, ja & en_us)  
locale-gen
echo "LANG=\"en_US.UTF-8\"" > /etc/locale.conf  
echo "KEYMAP=fr-pc" > /etc/vconsole.conf  
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime  
mkinitcpio -p linux  
pacman -S syslinux  
syslinux-install_update -iam  
then edit /boot/syslinux/syslinux.cfg if /dev/sdaX is not correct  
systemctl enable wicd  
activate Color and multilib in /etc/pacman.conf

Japanese
++++++++

gtk-query-immodules-2.0  
copy in ~/.gtkrc-2.0 :  
  im_module_file "/etc/gtk-2.0/gtk.immodules"
