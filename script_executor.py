import subprocess


from flask import Flask, request, render_template  
  
# Flask constructor 
app = Flask(__name__)    
  
# A decorator used to tell the application 
# which URL is associated function 
@app.route('/', methods =["GET", "POST"]) 
def gfg(): 
    if request.method == "POST": 
        git_url = request.form.get("giturl") 
        git_url = "https://github.com/sunilkumarmohapatra/InstagramJetpackCompose.git"
        subprocess.call(['sh', 'android_sdk_tools_installer.sh']) 
        subprocess.call(['sh', 'apk_installer_from_git.sh', git_url]) 
    return render_template("input-form.html") 
  
if __name__=='__main__': 
   app.run() 
