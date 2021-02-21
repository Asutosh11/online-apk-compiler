#!bash

export QTWEBENGINE_DISABLE_SANDBOX=1
echo "y" | sudo /usr/lib/android-sdk/cmdline-tools/tools/bin/sdkmanager --install "system-images;android-29;google_apis_playstore;x86"

echo "no" | sudo /usr/lib/android-sdk/cmdline-tools/tools/bin/avdmanager create avd -n nexus6p -k "system-images;android-29;google_apis_playstore;x86" -b x86 -c 2048M -f

sudo chmod 777 /usr/lib/android-sdk
mkdir -p ~/emulator
cp -v /usr/lib/android-sdk/emulator/* ~/emulator
sudo chmod -R 777 ~/emulator
sudo cp /usr/lib/android-sdk/platform-tools/adb ~
sudo chmod 777 ~/adb

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

cd ~/cloned_android_project/app/build/outputs/apk/debug

~/emulator/emulator -avd nexus6p & adb wait-for-device && sleep 5 && ~/adb install app-debug.apk

# IMP: remove this comment if you want to launch the App on an emulator. Also comment out above line if installation on physical device not needed.
# sudo /usr/lib/android-sdk/platform-tools/adb -s nexus6p install app-debug.apk




