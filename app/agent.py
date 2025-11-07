from flask import Flask, render_template, Response
import psutil
from prometheus_client import Gauge, REGISTRY, generate_latest

app = Flask(__name__)


CPU_GAUGE = Gauge('system_cpu_usage_percent', 'CPU ')
MEM_GAUGE = Gauge('system_memory_usage_percent', ' RAM ')

@app.route('/')
def index():

    cpu_percent = psutil.cpu_percent(interval=0.1)
    mem_percent = psutil.virtual_memory().percent
    CPU_GAUGE.set(cpu_percent)
    MEM_GAUGE.set(mem_percent)
    

    message = None
    if cpu_percent > 80 or mem_percent > 80:
        message = "HIGH CPU or memory!"

    return render_template("index.html", 
                           cpu_percent=cpu_percent, 
                           mem_percent=mem_percent, 
                           message=message)

@app.route('/health')
def health():
    return "OK", 200

@app.route('/metrics')
def metrics():
    return Response(generate_latest(REGISTRY), mimetype='text/plain')


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8001)