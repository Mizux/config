#!/usr/bin/bash

echo "update System..."
sudo pacman -Syu
echo "update System Done"

echo "install Dev..."
sudo pacman -S --needed python2-pip swig
echo "install Dev Done"
