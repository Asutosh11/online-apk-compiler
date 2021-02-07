import subprocess

default_git_url = "https://github.com/Asutosh11/GroceryTracker.git"

subprocess.call(['sh', 'android_sdk_tools_installer.sh']) 
subprocess.call(['sh', 'apk_installer_from_git.sh', default_git_url]) 
