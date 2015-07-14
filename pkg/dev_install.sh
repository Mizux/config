#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install Dev..."
pacman -S --needed git tk tig aspell-en aspell-fr meld sloccount \
qtcreator ipython clang cmake ninja gdb strace valgrind \
boost blas lapack eigen opencv lua \
bullet box2d openscenegraph qt qt4 \
sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf \
doxygen graphviz ctags upx \
desmume
echo "install Dev Done"
