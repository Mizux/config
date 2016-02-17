#!/usr/bin/env bash

# QT
if [ ! -d ~/Qt ]; then
	cd /tmp
	if [ ! -f qt-opensource-linux-x64-online.run ]; then
		echo "Download qt..."
		wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run
		echo "4dcd6466db975358195d59cff3442e85  qt-unified-linux-x64-online.run" > check.txt
		if ! md5sum -c check.txt; then
			rm check.txt
			rm *.run
			exit 1
		fi
		rm check.txt
	fi
	echo "Install qt..."
	chmod a+x qt-unified-linux-x64-online.run
	./qt-unified-linux-x64-online.run
	rm qt-unified-linux-x64-online.run
fi

echo "Please add this to your zshrc..."
echo "# QT"
echo "export ANDROID_QT_ROOT=~/Qt/5.5/android_armv7"
echo "export PATH=~/Qt/Tools/QtCreator/bin:$PATH"

# Android/QT CMake


echo "SUCCESS !"
