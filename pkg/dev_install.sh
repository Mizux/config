#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install Dev tools..."
pacman -S --needed \
base-devel gvim aspell-en aspell-fr \
git tk tig \
meld \
cmake ninja gcc gdb clang \
upx strace valgrind ctags \
lua \
opencv \
bullet box2d \
qtcreator qt5 qt5-doc \
code nodejs npm \
ipython \
doxygen graphviz
echo "install Dev Done"

echo "install Docker..."
pacman -S --needed \
docker
systemctl enable docker.service
systemctl start docker.service
echo "install Docker Done"

exit

# Deprecated
cppcheck llvm \
mercurial \
cscope sloccount \

boost blas lapack eigen \
openscenegraph \
qt4

echo "Extensions for vscode:"
echo "* vscodevim.vim"
echo "* ms-vscode.cmake-tools"
echo "* twxs.cmake"
echo "* geequlim.godot-tools"
echo ""
