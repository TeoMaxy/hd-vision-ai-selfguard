import os
import uuid
from flask import Flask, render_template, request, jsonify, send_from_directory

app = Flask(__name__, static_folder='static', template_folder='templates')

# Временна база данни за клиенти (може да ползваш SQLite/PostgreSQL)
CLIENTS_DB = {}

@app.route('/')
def index():
    # Генерира уникален инсталационен токен за сесията/клиента
    session_token = str(uuid.uuid4())[:8]
    return render_template('index.html', token=session_token)

@app.route('/static/<path:filename>')
def serve_static(filename):
    return send_from_directory(app.static_folder, filename)

# API за регистрация / проверка от локалния агент
@app.route('/api/v1/agent/ping', methods=['POST'])
def agent_ping():
    data = request.get_json()
    token = data.get('token')
    status = data.get('status')
    
    if token:
        CLIENTS_DB[token] = {"status": status, "last_seen": "NOW"}
        print(f"[AGENT PING] Токен: {token} | Статус: {status}")
        return jsonify({"success": True, "message": "Agent verified"}), 200
    
    return jsonify({"error": "Invalid token"}), 400

# Stripe Webhook Endpoint
@app.route('/webhook/stripe', methods=['POST'])
def stripe_webhook():
    payload = request.get_data(as_text=True)
    # Тук stripe_bridge.py валидира плащането и активира токена
    print("[STRIPE WEBHOOK] Получено плащане по карта!")
    return jsonify({"status": "success"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
