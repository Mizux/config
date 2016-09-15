#!/usr/bin/env bash

# QT
INSTALLER="qt-unified-linux-x64-online.run"
INSTALLER_MD5="77a0f5fa86d648869b64229fb461c9f7"
if [ ! -d ~/Qt ]; then
	cd /tmp
	if [ ! -f qt-opensource-linux-x64-online.run ]; then
		echo "Download qt..."
		wget http://download.qt.io/official_releases/online_installers/${INSTALLER}
		echo "${INSTALLER_MD5}  ${INSTALLER}" > check.txt
		if ! md5sum -c check.txt; then
			rm check.txt
			rm ${INSTALLER}
			exit 1
		fi
		rm check.txt
	fi
	echo "Install qt..."
	chmod a+x ${INSTALLER}
	./${INSTALLER}
	rm ${INSTALLER}
fi

echo "Please add this to your zshrc..."
echo "# QT"
echo "export ANDROID_QT=~/Qt/5.7/android_armv7"

echo "SUCCESS !"
