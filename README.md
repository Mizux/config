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

Archlinux Install
-----------------------
```
loadkeys jp106
loadkeys fr-latin9
wifi-menu
```

cfdisk (82 swap )...  

| Name | Mount |Size(MB)| Format     |
| ---- | ----- | -----: | :--------: |
| sda1 | /boot |  100   | mkfs.ext2  |
| sda2 |       | 2048   | mkswap     |
| sda3 | /     | 20000  | mkfs.ext4  |
| sda4 | /home | ALL    | mkfs.ext4  |  

mkfs all...  
mount all...  
```
mount /dev/sda3 /mnt  
mkdir /mnt/{boot,home}  
mount /dev/sda1 /mnt/boot  
mount /dev/sda4 /mnt/home  
swapon /dev/sda2  
```
Install...
```
pacstrap /mnt base base-devel syslinux vim  
genfstab -L -p /mnt >> /mnt/etc/fstab  
arch-chroot /mnt  
echo G53J/CX61 > /etc/hostname  
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime  
vim /etc/locale.gen (en_us, fr, ja & utf-8)  
locale-gen  
echo "LANG=\"en_US.UTF-8\"" > /etc/locale.conf  
echo "KEYMAP=fr-latin9" > /etc/vconsole.conf  
echo "KEYMAP=jp106" > /etc/vconsole.conf  

mkinitcpio -p linux  
syslinux-install_update -iam
```
then edit /boot/syslinux/syslinux.cfg if /dev/sda3 is not correct  

Pacman...  
activate Color and multilib in /etc/pacman.conf

Wifi...
```
pacman -S wicd  
systemctl enable wicd  
wicd 1.7.3-1 fix: https://github.com/voidlinux/void-packages/commit/220de599ad3ecba14423289209a3e4e031037edf  
```

Printer...
```
pacman -S --needed cups ghostscript hplip
systemctl enable cups
systemctl start cups
```
Then add printer HP PhotoSmart 6520 using http://localhost:631/ discover network  
note use hpcups over hpijs to get border printed   

Adding User
-----------
useradd -g users -m -s /bin/bash \<username\>  

X Server multi-user
-------------------
Edit /etc/pam.d/su su-l and add:  
```
session        optional        pam_xauth.so
```
Disable laptop lid switch handle (usefull when using external screen)
---------------------------------------------------------------------
Edit /etc/systemd/logind.conf and enable:  
```
LidSwitchIgnoreInhibited=yes
```
Japanese
--------

gtk-query-immodules-2.0  
copy in ~/.gtkrc-2.0 :
```
im_module_file "/etc/gtk-2.0/gtk.immodules"
```
