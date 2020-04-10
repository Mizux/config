My install and configuration script for Archlinux.

# Archlinux Install
from: https://wiki.archlinux.org/index.php/Installation_guide 
## Download and Archlinux iso
Download from any mirror listed here: https://www.archlinux.org/download/
e.g. using https://mirrors.eric.ovh/arch/iso/2020.04.01/
```sh
wget https://mirrors.eric.ovh/arch/iso/2020.04.01/archlinux-2020.04.01-x86_64.iso
wget https://mirrors.eric.ovh/arch/iso/2020.04.01/archlinux-2020.04.01-x86_64.iso.sig
pacman-key -v archlinux-*-x86_64.iso.sig
```
note: on non archlinux system verify using
```sh
gpg --keyserver-options auto-key-retrieve --verify archlinux-*-x86_64.iso.sig
```

## Create USB
```sh
dd if=*.iso of=/dev/sdX status=progress oflag=sync
```
ref: [dd(1)](https://jlk.fjfi.cvut.cz/arch/manpages/man/dd.1#DESCRIPTION)

## Init
Change keyboard layout (default us):
```sh
loadkeys jp106
loadkeys fr-latin9
```
note: list `ls /usr/share/kbd/keymaps/**/*.map.gz`

Verify boot mode:
```sh
ls /sys/firmware/efi/efivars
```

Setup wifi:
```sh
wifi-menu
ip link
```

## Prepare the storage devices
cfdisk (82 swap )...  

| Name | Boot  | Size   | Format     | Mount |
| ---- | :---: | -----: | :--------: | ----- |
| sda1 | *     | 260M   | mkfs.ext2  | /boot |
| sda1 | *     | 260M   | efi        | /efi  |
| sda2 |       | 2G     | mkswap     |       |
| sda3 |       | 32G    | mkfs.ext4  | /     |
| sda4 |       | ALL    | mkfs.ext4  | /home |

mkfs all...  
mount all...  
```sh
mount /dev/sda3 /mnt  
mkdir /mnt/{boot,home}  
mount /dev/sda1 /mnt/boot  
mount /dev/sda4 /mnt/home  
swapon /dev/sda2  
```
## Install the base system
Replace \<foobar\> by what you want...
### Install essential packages
```sh
pacstrap /mnt base base-devel syslinux vim
pacstrap /mnt base base-devel linux linux-firmware vim
```
### Fstab
```sh
genfstab -L -p /mnt >> /mnt/etc/fstab
```
###  Chroot
```sh
arch-chroot /mnt
```
### Localization / Time zone
```sh
echo <laptop-name> > /etc/hostname
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
vim /etc/locale.gen (en_us, fr, ja & utf-8)
locale-gen
echo "LANG=\"en_US.UTF-8\"" > /etc/locale.conf
echo "KEYMAP=<fr-latin9/jp106>" > /etc/vconsole.conf
```
### Initramfs
not needed since pacstrap already did it
```sh
mkinitcpio -P
syslinux-install_update -iam
```
then edit `/boot/syslinux/syslinux.cfg` if `/dev/sda3` is not correct  

Pacman...  
activate Color and multilib in /etc/pacman.conf

## Wireless network configuration
```sh
pacman -S networkmanager  
systemctl enable NetworkManager.service  
```
list network: nmcli con show  
connect to network: nmcli dev wifi connect <name> password <password> [iface wlan1]  
or use the ncurse ui tool "nmtui"

## NTP Time Synchronization
```sh
timedatectl set-ntp true
```

## Archlinux package config
In root run:
```sh
cd tmp
git clone --depth=1 https://github.com/Mizux/config.git config
cd config/pkg && ./dev_install.sh
```

# User Configuration

## Adding User
```sh
useradd -g users -m -s /usr/bin/zsh <username>  
```
Adding user to a group:  
```sh
usermod -a -G <wheel,audio,video,disk,storage,docker> <username>  
```

## User config Installation
ArchLinux configuration files (zshrc...)  
simply run mizux/install.sh  
warning no backup are performed !  

## Japanese Install
To install japaneses, first install fonts:
```sh
pacman -S adobe-source-han-sans-jp-fonts otf-ipafont
```

Then install ibus　and configure it.
```sh
pacman -S ibus ibus-qt ibus-anthy 
ibus-setup
```
ibus-setup/Advanced: check use system layout.  
ibus-setup/InputMethod: add anthy for japanese.  
Also add this line in your `.xinitrc` (before `setxkbmap fr`)
```sh
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx
```
note: if using xfce4, put "ibus-daemon -drx" in autostart application otherwise firefox and chromium won't have ibus support (race cond)

# Misc

## X Server multi-user
Edit /etc/pam.d/su su-l and add:  
```sh
session        optional        pam_xauth.so
```

## Printer Management
```sh
pacman -S --needed cups ghostscript hplip
systemctl enable cups
systemctl start cups
systemctl start/enable org.cups.cupsd.service
systemctl start/enable cups-browsed.service
```
Then add printer HP PhotoSmart 6520 using http://localhost:631/ discover network  
note use hpcups over hpijs to get border printed   

### HP ENVY 5540
Add printer using: `socket://192.168.1.14:9100` and for driver: 
`HP Envy 5540 Series, hpcups 3.17.11 (en, en)`

## Disable laptop lid switch handle (usefull when using external screen)
Edit /etc/systemd/logind.conf and enable:  
```
LidSwitchIgnoreInhibited=yes
```

## xdg-open management
You must append `.desktop` to any binary.  
e.g. `feh` becomes `feh.desktop`...

### Query filetype
```sh
$ xdg-mime query filetype <example.png>
image/png
```

### Query default app
```sh
$ xdg-mime query default <image/png>
foobar.desktop
```

### Set default app
```sh
$ xdg-mime default <foobar.desktop> <image/png>
```

### Open file using default app
```sh
$ xdg-open <example.png>
```
