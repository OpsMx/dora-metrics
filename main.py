#from flask import Flask, request, jsonify
import logging

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

@app.route('/webhook', methods=['POST'])
def webhook():
    try:
        data = request.json

        if not data:
            return jsonify({"error": "No JSON payload provided"}), 400

        application = data.get("application")
        committed_at = data.get("committedAt")
        started_at = data.get("startedAt")
        finished_at = data.get("finishedAt")

        # Log each parameter
        logger.info(f"Application: {application}")
        logger.info(f"Committed At: {committed_at}")
        logger.info(f"Started At: {started_at}")
        logger.info(f"Finished At: {finished_at}")

        return jsonify({"status": "success"}), 200

    except Exception as e:
        logger.error(f"Error processing request: {e}")
        return jsonify({"error": "Internal server error"}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
