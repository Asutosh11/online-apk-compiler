import subprocess
from flask import Flask, request, render_template  
  
app = Flask(__name__)    

git_url = "https://github.com/Asutosh11/GroceryTracker.git"
  
@app.route('/', methods =["GET", "POST"]) 
def gfg(): 
    if request.method == "POST": 
        git_url = request.form.get("giturl") 
        subprocess.call(['sh', 'android_sdk_tools_installer.sh']) 
        subprocess.call(['sh', 'apk_installer_from_git.sh', git_url]) 
    return render_template("input-form.html") 
  
if __name__=='__main__': 
    app.run() 

