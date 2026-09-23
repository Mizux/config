#!/usr/bin/bash

set -x
pacman -Syu
pacman -S --needed acpid
systemctl enable acpid

cp backlight.sh /etc/acpi
cp ./events/* /etc/acpi/events
systemctl restart acpid
