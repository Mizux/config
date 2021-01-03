#!/usr/bin/bash
set -euxo pipefail

echo "update System..."
pacman -Syu
echo "update System Done"

echo "install Dev tools..."
pacman -S --needed \
base-devel dos2unix shellcheck \
man-pages man-db \
gvim aspell-en aspell-fr \
git tk tig \
meld \
graphviz plantuml
echo "install Dev Done"

echo "install C++..."
pacman -S --needed \
qtcreator qt5 qt5-doc \
doxygen \
upx strace valgrind kcachegrind ctags \
cmake ninja \
gcc gdb clang \
lua swig \
opencv bullet box2d
echo "install c++ Done"

echo "install Python..."
pacman -S --needed \
ipython python python-pip python-virtualenv
echo "install Python Done"

echo "install JS..."
pacman -S --needed \
code nodejs npm
echo "install JS Done"

echo "install Java..."
pacman -S --needed \
jdk-openjdk maven
echo "install Java Done"

echo "install .Net..."
pacman -S --needed \
dotnet-sdk
echo "install .Net Done"

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
