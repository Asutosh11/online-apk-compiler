#!bash

# clone the android project
# go to the project folder
git clone $1 cloned_android_project && cd $_

# execute it like this - 
# sh apk_installer_from_git.sh https://github.com/Asutosh11/CustomerSupportChat

chmod +x ./gradlew
./gradlew clean

touch local.properties
echo sdk.dir=/usr/lib/android-sdk >> local.properties

/usr/lib/android-sdk/cmdline-tools/tools/bin/sdkmanager --licenses

sudo ./gradlew assembleDebug
