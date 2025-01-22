#from flask import Flask, request, jsonify
import logging
import subprocess
import sys
import time
from datetime import datetime
from threading import Thread



try:
    from prometheus_client import start_http_server,CollectorRegistry, Gauge, generate_latest
except ImportError:
    subprocess.check_call([sys.executable, "-m", "pip", "install", "prometheus_client"])
    from prometheus_client import start_http_server,CollectorRegistry, Gauge, generate_latest


try:
    from flask import Flask, request, jsonify, abort
except ImportError:
    # If not installed, install PyGithub
    subprocess.check_call([sys.executable, "-m", "pip", "install", "flask"])
    from flask import Flask, request, jsonify  # Import again after installation

app = Flask(__name__)

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

#PUSHGATEWAY_URL = "http://prometheus-pushgateway.default.svc.cluster.local:9091"

# Define Prometheus metrics
#registry = CollectorRegistry()
#time_from_commit_to_start_sync = Gauge('time_from_commit_to_start_sync', 
#                                       'Time in seconds from commit to start sync', 
#                                       ['application'], 
#                                       registry=registry)
#time_to_sync = Gauge('time_to_sync', 
#                     'Time in seconds from start to finish', 
#                     ['application'], 
#                     registry=registry)

time_from_commit_to_start_sync = Gauge('time_from_commit_to_start_sync', 
                                       'Time in seconds from commit to start sync', 
                                       ['application','instance'])

time_to_sync = Gauge('time_to_sync', 
                     'Time in seconds from start to finish', 
                     ['application','instance'])

@app.route('/webhook', methods=['POST'])
def webhook():
    try:
        data = request.json

        if not data:
            return jsonify({"error": "No JSON payload provided"}), 400

        application = data.get("application")
        #committed_at = data.get("committedAt")
        #started_at = data.get("startedAt")
        #finished_at = data.get("finishedAt")

        started_at = datetime.strptime(data.get("startedAt"), "%Y-%m-%dT%H:%M:%SZ")
        committed_at = datetime.strptime(data.get("committedAt"), "%Y-%m-%dT%H:%M:%SZ")
        finished_at = datetime.strptime(data.get("finishedAt"), "%Y-%m-%dT%H:%M:%SZ")
        # Log each parameter
        logger.info(f"Application: {application}")
        logger.info(f"Committed At: {committed_at}")
        logger.info(f"Started At: {started_at}")
        logger.info(f"Finished At: {finished_at}")

        #time_from_commit_to_start_sync = (started_at - committed_at).total_seconds()
        #time_to_sync = (finished_at - started_at).total_seconds()

        logger.info(f"Time from commit to start sync: {time_from_commit_to_start_sync}s")
        logger.info(f"Time to sync: {time_to_sync}s")

        # Update and push metrics
        #time_from_commit_to_start_sync.labels(application=application).set(time_from_commit_to_start_sync)
        #time_to_sync.labels(application=application).set(time_to_sync)

        tfcts = (started_at - committed_at).total_seconds()
        tts = (finished_at - started_at).total_seconds()
        logger.info(f"tfcts: {tfcts}, tts: {tts}")

        time_from_commit_to_start_sync.labels(application=application, instance=application).set(tfcts)
        time_to_sync.labels(application=application, instance=application).set(tts)

        time_from_commit_to_start_sync.labels(application=application, instance=application).set((started_at - committed_at).total_seconds())
        time_to_sync.labels(application=application, instance=application).set((finished_at - started_at).total_seconds())

        

        return jsonify({"status": "success"}), 200

    except Exception as e:
        logger.error(f"Error processing request: {e}")
        return jsonify({"error": "Internal server error"}), 500


@app.route('/metrics')
def metrics():
    # Expose the metrics in Prometheus format
    registry = CollectorRegistry()
    registry.register(time_from_commit_to_start_sync)
    registry.register(time_to_sync)
    return generate_latest(registry), 200

if __name__ == '__main__':

    app.run(debug=True, host='0.0.0.0', port=5000)
