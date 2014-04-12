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
loadkeys jp106/fr-latin9
wifi-menu

cfdisk (82 swap )...  

| Name | Mount |Size(MB)| Format     |
| ---- | ----- | -----: | :--------: |
| sda1 | /boot |  100   | mkfs.ext2  |
| sda2 |       | 2048   | mkswap     |
| sda3 | /     | 20000  | mkfs.ext4  |
| sda4 | /home | ALL    | mkfs.ext4  |  

mount all...  
mount /dev/sda3 /mnt  
mkdir /mnt/{boot,home}  
mount /dev/sda1 /mnt/boot  
mount /dev/sda4 /mnt/home  
swapon /dev/sda2  

pacstrap /mnt base base-devel syslinux vim  
genfstab -L -p /mnt >> /mnt/etc/fstab  
archroot arch-chroot /mnt  
vim /etc/locale.gen (en_us, fr, ja & utf-8)  
locale-gen  
echo "LANG=\"en_US.UTF-8\"" > /etc/locale.conf  
echo "KEYMAP=fr-latin9" > /etc/vconsole.conf  
echo "KEYMAP=jp106" > /etc/vconsole.conf  
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime  

mkinitcpio -p linux  
syslinux-install_update -iam  
then edit /boot/syslinux/syslinux.cfg if /dev/sdaX is not correct  

pacman -S wicd
systemctl enable wicd  
activate Color and multilib in /etc/pacman.conf

Japanese
--------

gtk-query-immodules-2.0  
copy in ~/.gtkrc-2.0 :  
  im_module_file "/etc/gtk-2.0/gtk.immodules"
