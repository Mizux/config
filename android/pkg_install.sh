#!/usr/bin/env bash

echo "install aur packages..."
yaourt -Syu --aur
yaourt -S --needed --noconfirm \
gradle gradle-doc swt
echo "install aur packages Done"
