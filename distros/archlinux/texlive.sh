#!/usr/bin/env bash
set -euxo pipefail

if hash yay 2>/dev/null; then
  PKM=yay
else
  PKM=pacman
fi

echo "update System..."
$PKM -Syu
echo "update System...Done"

echo "install Texlive..."
$PKM -S --needed texlive-most texlive-langjapanese
echo "install Texlive...Done"
