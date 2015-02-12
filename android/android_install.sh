#!/usr/bin/env bash

mkdir ~/android
cd ~/android

echo "Download android ndk..."
wget http://dl.google.com/android/ndk/android-ndk-r10d-linux-x86_64.bin
echo "263b83071e6bca15f67898548d8d236e  android-ndk-r10d-linux-x86_64.bin" > check.txt
if ! md5sum -c check.txt; then
	rm check.txt
	exit 1
fi
chmod a+x android-ndk-r10d-linux-x86_64.bin
./android-ndk-r10d-linux-x86_64.bin
rm android-ndk-r10d-linux-x86_64.bin

echo "Download android sdk..."
wget http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz
echo "3631441448eb1c8ab7be30e6b2047604  android-sdk_r24.0.2-linux.tgz" > check.txt
if ! md5sum -c check.txt; then
	rm check.txt
	exit 2
fi
tar xzvf android-sdk_r24.0.2-linux.tgz
rm android-sdk_r24.0.2-linux.tgz

echo "Download android studio..."
wget https://dl.google.com/dl/android/studio/ide-zips/1.0.1/android-studio-ide-135.1641136-linux.zip
echo "33ac04f247bf5a25538b8c4d8d6258a8  android-studio-ide-135.1641136-linux.zip" > check.txt
if ! md5sum -c check.txt; then
	rm check.txt
	exit 2
fi
unzip android-studio-ide-135.1641136-linux.zip
rm android-studio-ide-135.1641136-linux.zip

# cleaning
rm check.txt

echo "Please install all revision 19 related (android 4.4.2)"
~/android/android-sdk-linux/tools/android

echo "Please add this to your bashrc..."
echo "# ANDROID"
echo "export JAVA_HOME=/usr/lib/jvm/default"
echo "export ANDROID_NDK_ROOT=~/android/android-ndk-r10d"
echo "export ANDROID_SDK_ROOT=~/android/android-sdk-linux"
echo "export ANDROID_HOME=$ANDROID_SDK_ROOT"
echo "export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

echo "Create Android Virtual Device rev.19 ARMv7"
~/android/android-sdk-linux/tools/android create avd --name Default --target android-19 --abi armeabi-v7a
echo "Test emulator..."
~/android/android-sdk-linux/tools/emulator -avd Default

echo "Create Hello World project (using gradle)"
~/android/android-sdk-linux/tools/android create project -p AppGradleTemplate -a Main -k com.mizux.app -t android-19 -g -v 1.0.1

echo "SUCCESS !"
