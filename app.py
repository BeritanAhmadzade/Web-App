from flask import Flask,render_template
from threading import Thread
app=Flask(__name__)
@app.route('/')
def index():
    return render_template('index.html')
def run_app():
    app.run(host='127.0.0.1',port=5000,debug=True,use_reloader=False)

thread=Thread(target=run_app)
thread.start()