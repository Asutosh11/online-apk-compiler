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

echo "y" | sudo /usr/lib/android-sdk/cmdline-tools/tools/bin/sdkmanager --install "system-images;android-29;google_apis_playstore;x86"

echo "no" | sudo /usr/lib/android-sdk/cmdline-tools/tools/bin/avdmanager create avd -n nexus6p -k "system-images;android-29;google_apis_playstore;x86" -b x86 -c 2048M -f

sudo ./gradlew clean
sudo ./gradlew assembleDebug

#sudo /usr/lib/android-sdk/emulator/emulator -avd ourAVD

#cd ~/cloned_android_project/app/build/outputs/apk/debug
#sudo /usr/lib/android-sdk/platform-tools/adb install app-debug.apk



