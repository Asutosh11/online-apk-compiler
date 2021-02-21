# online-apk-compiler
A web app that builds an APK from public Github repo and installs it on a USB connected Android device

### Requirements

1. A server running Linux (or a localhost)
2. Python 3.x installed
3. As of now this web app installs <i>build tools 29.0.2, 29.0.3, 30.0.3</i>. 
   If you want other versions, follow the comments in this file - ```android_sdk_tools_installer.sh```


### How to Install for Linux?
Run the build tools installer script
```shell
sudo apt-get install python3-pip
sudo pip3 install -r requirements.txt
sudo sh android_sdk_tools_installer.sh
```
### How to run it on Linux?
```shell
sudo python3 apk_installer_script.py
```

### How to install on non-linux systems?
Use Docker to install and run the web app

<a href = "https://docs.docker.com/engine/install/">Install Docker from here</a>

```shell
sudo docker build -t online-apk-compiler .
sudo docker run online-apk-compiler:latest
```


### Screenshots

<img src = "https://github.com/Asutosh11/online-apk-compiler/blob/main/screenshots/apk_installer.png">


### Features pending for upcoming releases
1. Support for private git repos (As of now, this web app only supports public git repos)
2. Feature to check if device is connected via USB or not (As of now, this web app assumes that the device is connected via USB)

