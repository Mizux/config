#!/usr/bin/env bash

echo "update System..."
sudo pacman -Syu
echo "update System Done"

echo "install Dev..."
sudo pacman -S --needed base jdk8-openjdk jre8-openjdk
echo "install Dev Done"
