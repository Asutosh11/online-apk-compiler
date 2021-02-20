#!bash
sudo apt-get update
sudo apt-get install python3.6

sudo apt install curl
curl -O https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz
tar zxvf openjdk-11.0.1_linux-x64_bin.tar.gz
mv jdk-11.0.1 /usr/local/

sudo touch /etc/profile.d/jdk11.sh
sudo chmod 777 /etc/profile.d/jdk11.sh
export JAVA_HOME=/usr/local/jdk-11.0.1 >>/etc/profile.d/jdk11.sh; export PATH=$PATH:$JAVA_HOME/bin >>/etc/profile.d/jdk11.sh
source /etc/profile.d/jdk11.sh

echo "Y" | sudo apt-get install android-sdk
export ANDROID_HOME=/usr/lib/android-sdk

wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip
echo "All" | unzip commandlinetools-linux-6609375_latest.zip -d cmdline-tools
sudo mv cmdline-tools $ANDROID_HOME/
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin:$PATH

cd ~

echo "y" | sudo /usr/lib/android-sdk/cmdline-tools/tools/bin/sdkmanager --install 'build-tools;29.0.2' 'platform-tools' 'platforms;android-29' 'tools'

echo "y" | sudo /usr/lib/android-sdk/cmdline-tools/tools/bin/sdkmanager --install 'build-tools;29.0.3' 'platform-tools' 'platforms;android-29' 'tools'

echo "y" | sudo /usr/lib/android-sdk/cmdline-tools/tools/bin/sdkmanager --install 'build-tools;30.0.3' 'platform-tools' 'platforms;android-30' 'tools'

# If you need to install build-tools of different version than the ones provided above, you can do it like this -> 

# echo "y" | sudo /usr/lib/android-sdk/cmdline-tools/tools/bin/sdkmanager --install 'build-tools;<build-tools-version>' 'platform-tools'
# 'platforms;android-<SdkVersion>' 'tools'

