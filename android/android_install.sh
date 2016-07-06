#!/usr/bin/env bash

# You'll need expect

mkdir -pv ~/android
cd ~/android

# NDK
NDK="android-ndk-r12b-linux-x86_64.zip"
if [ ! -d android-ndk-r12b ]; then
	if [ ! -f $NDK ]; then
		echo "Download android ndk..."
		wget http://dl.google.com/android/repository/${NDK}
	fi
	if ! md5sum -c <(echo "1d1a5ee71a5123be01e0dd9adb5df80d  ${NDK}"); then
		rm ${NDK}
		exit 1
	fi
	echo "Install android ndk..."
	unzip ${NDK}
	rm ${NDK}
fi

# SDK
SDK="android-sdk_r24.4.1-linux.tgz"
if [ ! -d android-sdk-linux ]; then
	if [ ! -f ${SDK} ]; then
		echo "Download android sdk..."
		wget http://dl.google.com/android/${SDK}
	fi
	if ! md5sum -c <(echo "978ee9da3dda10fb786709b7c2e924c0  ${SDK}"); then
		rm ${SDK}
		exit 2
	fi
	echo "Install android sdk..."
	tar xzvf ${SDK}
	rm ${SDK}
fi

echo "Install all revision 19 related (android 4.4.2)"
export PATH=~/android/android-sdk-linux/tools:$PATH
#android list sdk --extended
expect -c ' set timeout -1;\
spawn android - update sdk --all --no-ui --filter \
platform-tools,build-tools-23.0.2,android-19,sys-img-armeabi-v7a-android-19;\
expect "Do you accept the license" { exp_send "y\r";exp_continue } '

echo "Please add this to your bashrc..."
echo "# ANDROID"
echo "export JAVA_HOME=/usr/lib/jvm/default"
echo "export ANDROID_NDK_ROOT=~/android/android-ndk-r12b"
echo "export ANDROID_SDK_ROOT=~/android/android-sdk-linux"
echo "export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH"

echo "Create Android Virtual Device rev.19 ARMv7"
android create avd --name Default --target android-19 --abi armeabi-v7a
#echo "Test emulator..."
#echo "export ANDROID_SDK_HOME=~"
#emulator -avd Default # use ANDROID_SDK_HOME/.android for cache

echo "SUCCESS !"
