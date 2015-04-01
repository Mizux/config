My install and configuration script for Archlinux.

Archlinux Install
=================

Init
----
```
loadkeys jp106
loadkeys fr-latin9
wifi-menu
```

Prepare the storage devices
---------------------------
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
Install the base system
-----------------------
Replace \<foobar\> by what you want...
```
pacstrap /mnt base base-devel syslinux vim  
genfstab -L -p /mnt >> /mnt/etc/fstab  
arch-chroot /mnt  
echo <laptop-name> > /etc/hostname  
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime  
vim /etc/locale.gen (en_us, fr, ja & utf-8)  
locale-gen  
echo "LANG=\"en_US.UTF-8\"" > /etc/locale.conf  
echo "KEYMAP=<fr-latin9/jp106>" > /etc/vconsole.conf  

mkinitcpio -p linux  
syslinux-install_update -iam
```
then edit /boot/syslinux/syslinux.cfg if /dev/sda3 is not correct  

Pacman...  
activate Color and multilib in /etc/pacman.conf

Wireless network configuration
------------------------------
wicd seems broken on 1.7.3 please consider using networkmanager instead.
```
pacman -S wicd  
systemctl enable wicd  
wicd 1.7.3-1 fix: https://github.com/voidlinux/void-packages/commit/220de599ad3ecba14423289209a3e4e031037edf  
```

```
pacman -S networkmanager  
systemctl enable NetworkManager.service  
```
list network: nmcli con show  
connect to network: nmcli dev wifi connect <name> password <password> [iface wlan1]  

Archlinux package config
------------------------
In root run:
```
git clone --depth=1 https://github.com/Mizux/config.git config
cd config/root && ./pkg_install.sh
```

User Configuration
==================

Adding User
-----------
useradd -g users -m -s /usr/bin/zsh \<username\>  

User config Installation
-------------------------

ArchLinux configuration files (zshrc...)  
simply run mizux/install.sh  
warning no backup are performed !  

Japanese Install
----------------

To install japaneses, first install fonts:
```
pacman -S adobe-source-han-sans-jp-fonts otf-ipafont
```

Then install ibus and configure it.
```
pacman -S ibus ibus-qt ibus-anthy 
```

Also add this line in your .xinitrc (before setxkbmap fr)
```
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx
```
note: if using xfce4, put "ibus-daemon -drx" in autostart application otherwise firefox and chromium won't have ibus support (race cond)

Misc
====

X Server multi-user
-------------------
Edit /etc/pam.d/su su-l and add:  
```
session        optional        pam_xauth.so
```

Printer Management
------------------
```
pacman -S --needed cups ghostscript hplip
systemctl enable cups
systemctl start cups
```
Then add printer HP PhotoSmart 6520 using http://localhost:631/ discover network  
note use hpcups over hpijs to get border printed   

Disable laptop lid switch handle (usefull when using external screen)
---------------------------------------------------------------------
Edit /etc/systemd/logind.conf and enable:  
```
LidSwitchIgnoreInhibited=yes
```
