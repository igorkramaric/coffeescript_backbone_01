from flask import Flask, render_template, send_from_directory

app = Flask(__name__, static_url_path='')


@app.route("/")
def hello():
    return "Hello World!"

@app.route('/temp/')
#@app.route('/hello/<name>')
def temp(name=None):
    return render_template('hello.html', name=name)

@app.route('/bb/')
@app.route('/bb/<test_num>')
@app.route('/bb/<test_num>/<ver_num>')
def bb(test_num="1", ver_num=""):
    return render_template( "bb.html", test_num=test_num, ver_num=ver_num)

@app.route('/scripts/<path:filename>')
def send_foo(filename):
    return send_from_directory('scripts', filename)

if __name__ == "__main__":
    # run with auto reload
    app.run(debug=True)
