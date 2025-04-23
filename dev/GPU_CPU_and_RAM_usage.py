
#pip install psutil flask flask-cors gputil
#nohup python server.py > server_log.txt 2>&1 &

#!/usr/bin/env python3
"""
Server Metrics API - Provides real-time GPU, CPU and RAM usage via HTTP
"""

import json
import os
import time
import psutil
import subprocess
from flask import Flask, jsonify, Response
from flask_cors import CORS
import GPUtil

app = Flask(__name__)
CORS(app)  # Enable cross-origin requests

def get_ram_info():
    """Get RAM usage information"""
    memory = psutil.virtual_memory()
    return {
        "total": memory.total / (1024 ** 3),  # Convert to GB
        "used": memory.used / (1024 ** 3),
        "free": memory.available / (1024 ** 3),
        "percent": memory.percent
    }

def get_cpu_info():
    """Get CPU usage information"""
    # Get per-core CPU percentage over 0.5 second interval
    per_cpu_percent = psutil.cpu_percent(interval=0.5, percpu=True)
    
    # Get overall CPU percentage
    overall_percent = sum(per_cpu_percent) / len(per_cpu_percent)
    
    # Get CPU frequency information if available
    freq = psutil.cpu_freq()
    frequency = None
    if freq:
        frequency = {
            "current": freq.current,
            "min": freq.min if hasattr(freq, 'min') else None,
            "max": freq.max if hasattr(freq, 'max') else None
        }
    
    return {
        "overall_percent": overall_percent,
        "per_cpu_percent": per_cpu_percent,
        "frequency": frequency,
        "core_count": psutil.cpu_count(logical=True),
        "physical_core_count": psutil.cpu_count(logical=False)
    }

def get_gpu_info():
    """Get GPU usage information"""
    try:
        gpus = GPUtil.getGPUs()
        gpu_data = []
        
        for i, gpu in enumerate(gpus):
            gpu_data.append({
                "id": i,
                "name": gpu.name,
                "load": gpu.load * 100,  # Convert to percentage
                "memory": {
                    "total": gpu.memoryTotal,  # In GB
                    "used": gpu.memoryUsed,    # In GB
                    "free": gpu.memoryFree,    # In GB
                    "percent": (gpu.memoryUsed / gpu.memoryTotal) * 100
                },
                "temperature": gpu.temperature
            })
        
        return gpu_data
    except Exception as e:
        print(f"Error retrieving GPU info: {e}")
        return []

@app.route('/metrics', methods=['GET'])
def metrics():
    """API endpoint to get all metrics"""
    data = {
        "timestamp": time.time(),
        "cpu": get_cpu_info(),
        "ram": get_ram_info(),
        "gpu": get_gpu_info()
    }
    return jsonify(data)

@app.route('/metrics/stream', methods=['GET'])
def metrics_stream():
    """Stream metrics as server-sent events"""
    def generate():
        while True:
            data = {
                "timestamp": time.time(),
                "cpu": get_cpu_info(),
                "ram": get_ram_info(),
                "gpu": get_gpu_info()
            }
            yield f"data: {json.dumps(data)}\n\n"
            time.sleep(1)  # Update every second

    return Response(generate(), mimetype='text/event-stream')

if __name__ == '__main__':
    # Install dependencies if not already installed
    try:
        import GPUtil
        import flask
        import flask_cors
    except ImportError:
        print("Installing required packages...")
        os.system('pip install psutil flask flask-cors gputil')
        print("Please restart the script after installation.")
        exit(1)
        
    # Run the server on all interfaces on port 5000
    app.run(host='0.0.0.0', port=5000, threaded=True)
