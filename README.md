My install steps and configuration script for Archlinux.

# Archlinux Install
First read and keep open the [Installation Guide](https://wiki.archlinux.org/index.php/Installation_guide).

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
nuc10i7: You may need to disable safe-boot in order to boot from the usb stick.

Change keyboard layout (default us):
```sh
loadkeys jp106
loadkeys fr-latin9
```
note: list `ls /usr/share/kbd/keymaps/**/*.map.gz`

Verify if boot mode is efi:
```sh
ls /sys/firmware/efi/efivars
```

Setup wifi:
```sh
wifi-menu
ip link
ping archlinux.org
```

Setup time
```sh
timedatectl set-ntp true
```

## Prepare the storage devices
### BIOS with MBR (cx61, flex2)
```sh
cfdisk /dev/sda
```

| Name      | Boot  | Size   | Type       | Format Cmd    | Mount     |
| --------- | :---: | -----: | ---------: | :-----------: | --------- |
| /dev/sda1 | *     | 260M   | Linux Sys  | mkfs.ext2     | /mnt/boot |
| /dev/sda2 |       | ALL    | Linux Sys  | mkfs.ext4     | /mnt      |
| /dev/sda3 |       | 2G     | Linux SWAP | mkswap        |           |

mkfs all...  
mount all...  
```sh
mount /dev/sda2 /mnt  
mkdir /mnt/boot  
mount /dev/sda1 /mnt/boot  
swapon /dev/sda3
```

### UEFI with GPT (nuc10i7)
```sh
cfdisk /dev/nvme0n1
```
note: Choose [**GPT** for UEFI](https://wiki.archlinux.org/index.php/Partitioning#Choosing_between_GPT_and_MBR)

| Name           | Size   | Type       | Format Cmd    | Mount    |
| -------------- | -----: | ---------: | :-----------: | -------- |
| /dev/nvme0n1p1 | 384M   | EFI Sys    | mkfs.fat -F32 | /mnt/efi |
| /dev/nvme0n1p2 | 928G   | Linux Sys  | mkfs.ext4     | /mnt     |
| /dev/nvme0n1p3 | 2G     | Linux SWAP | mkswap        |          |

ref: [EFI partition format](https://wiki.archlinux.org/index.php/EFI_system_partition#Format_the_partition)

mkfs all...  
mount all...  
```sh
mount /dev/nvme0n1p2 /mnt  
mkdir /mnt/efi  
mount /dev/nvme0n1p1 /mnt/efi  
swapon /dev/nvme0n1p3  
```

## Install the base system
Replace \<foobar\> by what you want...
### Install essential packages
```sh
pacstrap /mnt base base-devel linux linux-firmware vim
```
note: For MBR you can add **syslinux** (bootloader)

### Fstab
```sh
genfstab -L -p /mnt >> /mnt/etc/fstab
```
`-L` will use device name e.g. `/dev/sdaX`,
you should use `-U` for `UUID` it's more robust but it's ugly IMHO.

###  Chroot
Time to chroot in it to finish the installation !
```sh
arch-chroot /mnt
```
### Localization / Time zone / Keymap
```sh
echo <laptop-name> > /etc/hostname
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
vim /etc/locale.gen (en_us, fr, ja & utf-8)
locale-gen
echo "LANG=\"en_US.UTF-8\"" > /etc/locale.conf
echo "KEYMAP=<fr-latin9/jp106>" > /etc/vconsole.conf
```

### Initramfs
#### [UEFI only] Setup
Since Archlinux will generate initramfs image in `/boot` but image must be in the `/efi`
partition you should bind it in `/efi` partition.
First, try using:
```sh
mkdir -p /efi/EFI/arch
mount --bind /efi/EFI/arch /boot
```
Then, simply add to /etc/fstab (see bootloader part at the end)
```
/efi/EFI/arch          /boot           none            defaults,bind   0 0
```
ref: [Using bind mount](https://wiki.archlinux.org/index.php/EFI_system_partition#Using_bind_mount)

#### Initramfs build
Now it's time to generate the initramfs
```sh
mkinitcpio -P
```

#### [MBR only] Setup
Once build, you need to update the syslinux bootloader:
```sh
syslinux-install_update -iam
```
then edit `/boot/syslinux/syslinux.cfg` if `/dev/sda3` is not correct  

### Pacman Setup  
* Activate `Color` and `multilib` in `/etc/pacman.conf`
* update Mirror list (copy your current location mirrors at top) in `/etc/pacman.d/mirrorlist`

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

## UEFI Bootloader
First create the loader stuff in the `/efi` partition 
```
bootctl --path=/efi
```
### Create Default loader
Then in `/efi/loader/loader.conf` 
```
default arch.conf
timeout 5
console-mode max
editor no
```

### Create Arch conf
You should already have done this in the fstab/initramfs part but double check !
```sh
mkdir -p /efi/EFI/arch
```
Should contains at least `initramfs-linux.img  vmlinuz-linux` if `/boot bind`
has been correctly binded, otherwise copy `/boot/*` in `/efi/EFI/arch`.

Then create a `/efi/loader/entries/arch.conf` with:
```
title Arch Linux
linux /EFI/arch/vmlinuz-linux
initrd /EFI/arch/initramfs-linux.img
options root=/dev/nvme0n1p2 rw
```

and a `/efi/loader/entries/arch_fallback.conf` :
```
title Arch Linux Fallback
linux /EFI/arch/vmlinuz-linux
initrd /EFI/arch/initramfs-linux-fallback.img
options root=/dev/nvme0n1p2 rw
```

note: For `root` parameter, the linux kernel support [this format](https://github.com/torvalds/linux/blob/f49aa1de98363b6c5fba4637678d6b0ba3d18065/init/do_mounts.c#L191-L219).

**NOW, YOU SHOULD BE ABLE TO REBOOT**

# Archlinux package config
In root run:
```sh
cd tmp
git clone --depth=1 https://github.com/Mizux/config.git config
cd config/pkg && ./dev_install.sh
```

# User Management
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

# Japanese Install
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

## Flex2 Disable laptop lid switch handle (usefull when using external screen)
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
