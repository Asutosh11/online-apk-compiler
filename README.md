# online-apk-compiler
A web app that builds an APK from Github repository URL and installs it on a USB connected Android device

### Requirements

1. A server running Linux (or a localhost)
2. Python 3.x installed
3. As of now this tools installs <i>build tools 29.0.2, 29.0.3, 30.0.3</i>. 
   If you want other versions, follow the comments in this file - ```android_sdk_tools_installer.sh```


### How to Install?
Run the build tools installer script
```shell
pip install -r requirements.txt
python build_tools_installer_script.py
```
### Next step?
Use the APK installer tool
```shell
python apk_installer_script.py
```

### Alternative way for non-Linux personal computers
Can use the Dockerfile in the project to install the tools


### Screenshots

<img src = "https://github.com/Asutosh11/online-apk-compiler/blob/main/screenshots/build_tools_installer.png">

<img src = "https://github.com/Asutosh11/online-apk-compiler/blob/main/screenshots/apk_installer.png">



