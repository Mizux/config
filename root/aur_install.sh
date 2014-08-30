#!/usr/bin/bash

echo "install Android..."
yaourt -S --needed
android-tools android-udev-git \
android-sdk android-sdk-platform-tools android-sdk-build-tools \
android-platform android-ndk \
android-studio android-apktool
echo "install Android Done"

