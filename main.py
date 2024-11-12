from flask import Flask, render_template
from flask_socketio import SocketIO, emit

app = Flask(__name__)
socketio = SocketIO(app)

@app.route("/")
def hello():
    return render_template("index.html") 

@socketio.on('ping')
def handle_message(data):
    print('Received PING', flush=True)
    emit('pong', {})

app.run(host='127.0.0.1', debug=True, port=5000)
