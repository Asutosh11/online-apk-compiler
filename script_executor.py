import subprocess
from flask import Flask, request, render_template  
  
app = Flask(__name__)    

git_url = "https://github.com/Asutosh11/GroceryTracker.git"

@app.route('/')
def render_index_page():
   return render_template('index.html')
  
@app.route('/result', methods =["POST"]) 
def proess_html_input(): 
    if request.method == "POST": 
        git_url = request.form.get("giturl") 
        subprocess.call(['sh', 'android_sdk_tools_installer.sh']) 
        subprocess.call(['sh', 'apk_installer_from_git.sh', git_url]) 
    return render_template("process_status.html") 
  
if __name__=='__main__': 
    app.run() 

