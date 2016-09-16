#!/usr/bin/env bash

# You'll need curl, unzip and tar
mkdir -pv ~/android
cd ~/android

# NDK
curl -L -O https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip
unzip android-ndk* && rm android-ndk*.zip && mv android-ndk* android-ndk

# SDK
curl -L -O https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar xf android-sdk* && rm android-sdk*.tgz
echo y | ./android-sdk-linux/tools/android update sdk --force --all --no-ui --filter \
platform-tools,tools,build-tools-24.0.2,build-tools-19.1.0,android-19,sys-img-armeabi-v7a-android-19

echo "Please add this to your bashrc..."
echo "# ANDROID"
echo "export JAVA_HOME=/usr/lib/jvm/default"
echo "export ANDROID_HOME=~/android/android-sdk-linux"
echo "export ANDROID_NDK_HOME=~/android/android-ndk"
echo "export ANDROID_SDK_HOME=~/android/android-sdk-linux"
echo "export PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:$PATH"

#echo "Create Android Virtual Device rev.19 ARMv7"
#android create avd --name Default --target android-19 --abi armeabi-v7a
#echo "Test emulator..."
#echo "export ANDROID_SDK_HOME=~"
#emulator -avd Default # use ANDROID_SDK_HOME/.android for cache

echo "SUCCESS !"
