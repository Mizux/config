#!/usr/bin/bash

echo "install Android..."
yaourt -Syu --aur
yaourt -S --needed --noconfirm \
android-tools android-udev-git \
android-sdk android-sdk-platform-tools android-sdk-build-tools \
android-platform android-ndk32 \
android-apktool android-studio gradle gradle-doc
echo "install Android Done"
