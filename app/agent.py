from flask import Flask, render_template
import psutil

app = Flask(__name__)

@app.route('/')
def index():
    cpu_percent = psutil.cpu_percent(interval=0.1)
    mem_percent = psutil.virtual_memory().percent
    
    message = None
    if cpu_percent > 80 or mem_percent > 80:
        message = "HIGH CPU or memory utilization dectected!"

    return render_template("index.html", 
                           cpu_percent=cpu_percent, 
                           mem_percent=mem_percent, 
                           message=message)

@app.route('/health')
def health():
    return "OK", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8001)