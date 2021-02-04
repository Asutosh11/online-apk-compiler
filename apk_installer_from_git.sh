#!bash

sudo chmod 777 /usr/lib/android-sdk
cd ~

# delete the folder - 'cloned_android_project', if it already exists
DIR=cloned_android_project
if [ -d "$DIR" ]; then
    sudo rm -rf "$DIR"
fi

git clone $1 cloned_android_project
cd cloned_android_project

sudo chmod +x ./gradlew

touch local.properties
echo sdk.dir=/usr/lib/android-sdk >> local.properties

sudo ./gradlew clean
sudo ./gradlew assembleDebug

cd app/build/outputs/apk/debug
sudo /usr/lib/android-sdk/platform-tools/adb install app-debug.apk



