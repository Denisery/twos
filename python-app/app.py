# Install flask by running `pip install flask`
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Python Flask!"

@app.route('/login')
def login():
    return "Hello from Python Flask! login page"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
