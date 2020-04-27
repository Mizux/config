#!/usr/bin/bash

echo "update System..."
pacman -Syu
echo "update System Done"

#echo "install Python2 dev..."
pacman -S --needed \
ipython2 python2-pip python2-virtualenv \
python2-numpy
echo "install Python2 dev Done"

exit

# Deprecated
#ython2-beautifulsoup4 python2-docopt python2-dateutil \
python2-matplotlib \
python2-paramiko python2-pytz python2-requests python2-sphinx \

