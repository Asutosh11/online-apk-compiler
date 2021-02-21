import subprocess
from flask import Flask, request, render_template, Response
from pygments import highlight
from pygments.formatters import HtmlFormatter
from pygments.lexers import BashLexer
from jinja2 import Environment
from jinja2.loaders import FileSystemLoader
import io
  
app = Flask(__name__)     

@app.route('/')
def render_index_page():
   return render_template('apk_installer.html')   

@app.route('/apk-result', methods =["POST", "GET"]) 
def process_html_input(): 
    result = None
    git_url = request.form.get("giturl") 
    
    def inner():
        command = ['sh', 'android_sdk_tools_installer.sh']
        subprocess.call(command) 
        proc = subprocess.Popen(
            command,
            stdout=subprocess.PIPE,
        )
        
        for line in io.TextIOWrapper(proc.stdout, encoding="utf-8"): 
            yield highlight(line, BashLexer(), HtmlFormatter())
     
    result = inner    
    env = Environment(loader=FileSystemLoader('templates'))
    tmpl = env.get_template('apk_installer.html')
    return Response(tmpl.generate(result=result if result is None else result()))
    
if __name__=='__main__': 
    app.run()
