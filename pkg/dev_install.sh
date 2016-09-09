#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install Dev tools..."
pacman -S --needed base-devel \
qtcreator ipython docker \
git tk tig mercurial aspell-en aspell-fr meld \
upx strace valgrind cppcheck \
doxygen graphviz ctags cscope sloccount \
cmake ninja gcc gdb clang clang-analyzer llvm
echo "install Dev Done"
echo "install 3rd Party..."
pacman -S --needed \
boost blas lapack eigen opencv lua \
bullet box2d openscenegraph qt5 qt5-doc qt4
echo "install 3rd Party Done"
