#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install Dev tools..."
pacman -S --needed base-devel\
git tk tig mercurial aspell-en aspell-fr meld sloccount \
doxygen graphviz ctags \
upx \
qtcreator ipython cmake ninja clang gcc gdb strace valgrind cppcheck \
echo "install  tools..."
boost blas lapack eigen opencv lua \
bullet box2d openscenegraph qt qt5-doc qt4 \
sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf \
desmume
echo "install Dev Done"
