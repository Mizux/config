#!/usr/bin/env bash

echo "Install archlinux needed package"
yaourt -S --needed --noconfirm expect

mkdir -pv ~/android
cd ~/android

# NDK
if [ ! -d android-ndk-r10e ]; then
	if [ ! -f android-ndk-r10e-linux-x86_64.bin ]; then
		echo "Download android ndk..."
		wget http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin
	fi
	if ! md5sum -c <(echo "19af543b068bdb7f27787c2bc69aba7f  android-ndk-r10e-linux-x86_64.bin"); then
		rm *.bin
		exit 1
	fi
	echo "Install android ndk..."
	chmod a+x android-ndk-r10e-linux-x86_64.bin
	./android-ndk-r10e-linux-x86_64.bin
	rm android-ndk-r10e-linux-x86_64.bin
fi

# SDK
if [ ! -d android-sdk-linux ]; then
	if [ ! -f android-sdk_r24.4.1-linux.tgz ]; then
		echo "Download android sdk..."
		wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
	fi
	if ! md5sum -c <(echo "978ee9da3dda10fb786709b7c2e924c0  android-sdk_r24.4.1-linux.tgz"); then
		rm *.tgz
		exit 2
	fi
	echo "Install android sdk..."
	tar xzvf android-sdk_r24.4.1-linux.tgz
	rm android-sdk_r24.4.1-linux.tgz
fi

echo "Install all revision 19 related (android 4.4.2)"
export PATH=~/android/android-sdk-linux/tools:$PATH
#android list sdk --extended
expect -c ' set timeout -1;\
spawn android - update sdk --all --no-ui --filter \
platform-tools,build-tools-23.0.1,android-19,sys-img-armeabi-v7a-android-19;\
expect "Do you accept the license" { exp_send "y\r";exp_continue } '

echo "Please add this to your bashrc..."
echo "# ANDROID"
echo "export JAVA_HOME=/usr/lib/jvm/default"
echo "export ANDROID_NDK_ROOT=~/android/android-ndk-r10e"
echo "export ANDROID_SDK_ROOT=~/android/android-sdk-linux"
echo "export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH"

echo "Create Android Virtual Device rev.19 ARMv7"
android create avd --name Default --target android-19 --abi armeabi-v7a
#echo "Test emulator..."
#echo "export ANDROID_SDK_HOME=~"
#emulator -avd Default # use ANDROID_SDK_HOME/.android for cache

echo "SUCCESS !"
