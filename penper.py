import re
import configparser
import sqlite3
from bottle import route, run, template
from bottle import request, static_file
from bottle import get, post, redirect, abort, response

config = configparser.ConfigParser()
config.read('config/config.ini')

# setting
HOST = config["web"]["host"]
PORTNUM = config["web"]["port_num"]

# database connection
db_path = 'DB/penper.db'

con = sqlite3.connect(db_path)
cursor = con.cursor

# debug
papers = ["dummy1", "dummy2", "dummy3", "dummy4", "dummy5"]

def get_save_path(title):
    title = title + ".pdf"
    return "paper/pdf/" + title

@route("/static/css/<filename>")
def css(filename):
    return static_file(filename, root="static/css")

@route("/static/js/<filename>")
def js(filename):
    return static_file(filename, root="static/js")

@route("/paper/<ext>/<filename>")
def view_file(ext, filename):
    root = "paper/" + ext
    return static_file(filename, root=root)

@post("/upload")
def do_upload():
    pdf_data = request.files.get('paper','')
    title = request.forms.get('title','')
    alert = {}
    if not pdf_data or not title:
        alert["message"] = "Please select PDF & input Title."
        alert["mode"] = "danger"
        return template("index", papers=papers, alert=alert)

    filename = pdf_data.raw_filename
    if not filename.lower().endswith(('.pdf')):
        alert["message"] = "File extension not allowed!"
        alert["mode"] = "danger"
    else:
        save_path = get_save_path(title)
        pdf_data.save(save_path)
        alert["message"] = "Success!"
        alert["mode"] = "primary"
    return template("index", papers=papers, alert=alert)

@route('/')
def index():
    return template("index", papers=papers, alert=None)

if __name__ == '__main__':
    run(host=HOST, port=PORTNUM, debug=True, reloader=True)
