#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

# Deprecated:
# gitlab-ci-multi-runner

echo "install Dev tools..."
pacman -S --needed base-devel \
cmake ninja gcc gdb clang llvm \
git tk tig mercurial \
meld \
docker \
ipython \
qtcreator code \
aspell-en aspell-fr \
doxygen graphviz \
upx strace valgrind cppcheck \
ctags cscope sloccount \

echo "install Dev Done"

echo "Extensions for vscode:"
echo "* vscodevim.vim"
echo "* ms-vscode.cmake-tools"
echo "* twxs.cmake"
echo "* geequlim.godot-tools"
echo ""

echo "install 3rd Party..."
pacman -S --needed \
boost blas lapack eigen opencv lua \
bullet box2d openscenegraph qt5 qt5-doc qt4
echo "install 3rd Party Done"
