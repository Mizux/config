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
git tk tig lazygit \
meld \
graphviz plantuml
echo "install Dev Done"

echo "install C++..."
pacman -S --needed \
qtcreator qt6 qt6-doc \
doxygen \
upx strace valgrind kcachegrind ctags \
cmake ninja ccache \
gcc gdb clang \
lua swig \
opencv bullet box2d
echo "install c++ Done"

echo "install Python..."
pacman -S --needed \
rustup
echo "install Python Done"

echo "install Python..."
pacman -S --needed \
ipython python python-pip python-wheel python-virtualenv
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
docker docker-buildx
systemctl enable docker.service
systemctl start docker.service
echo "install Docker Done"

echo "install Vagrant..."
pacman -S --needed \
vagrant virtualbox
echo "install Vagrant Done"

exit

# Deprecated
# shellcheck disable=SC2317  # Don't warn about unreachable commands
cppcheck llvm \
mercurial \
cscope sloccount \

# shellcheck disable=SC2317  # Don't warn about unreachable commands
boost blas lapack eigen \
openscenegraph \
qt5 qt4

# shellcheck disable=SC2317  # Don't warn about unreachable commands
# `code --list-extensions`
(echo "Extensions for vscode:"
echo "* vscodevim.vim"
echo "* ms-vscode.cmake-tools"
echo "* twxs.cmake"
echo "* geequlim.godot-tools"
echo "")
