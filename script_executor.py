import subprocess

git_url = "https://github.com/sunilkumarmohapatra/InstagramJetpackCompose.git"

subprocess.call(['sh', 'android_sdk_tools_installer.sh']) 
subprocess.call(['sh', 'apk_installer_from_git.sh', git_url]) 
