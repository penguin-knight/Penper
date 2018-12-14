import re
import configparser
from bottle import route, run, template
from bottle import request, static_file
from bottle import get, post, redirect, abort, response

config = configparser.ConfigParser()
config.read('config/config.ini')

# setting
HOST = config["web"]["host"]
PORTNUM = config["web"]["port_num"]

# debug
papers = ["dummy1", "dummy2", "dummy3", "dummy4", "dummy5"]

@route("/static/css/<filename>")
def css(filename):
    return static_file(filename, root="static/css")

@route("/static/js/<filename>")
def js(filename):
    return static_file(filename, root="static/js")

@route("/paper/pdf/<filename>")
def pdf(filename):
    return static_file(filename, root="paper/pdf")

@post("/upload")
def do_upload():
    # upload
    message = "Success!"
    return template("index", papers=papers, message=message)

@route('/')
def index():
    return template("index", papers=papers, message=None)

if __name__ == '__main__':
    run(host=HOST, port=PORTNUM, debug=True, reloader=True)
