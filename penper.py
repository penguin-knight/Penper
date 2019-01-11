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
cursor = con.cursor()

def save_db(paper_info):
    cursor.execute("INSERT INTO penper(title, auther, note) VALUES(?,?,?)",
            (paper_info['title'], paper_info['auther'], paper_info['note']))
    con.commit()
    cursor.execute("SELECT * FROM sqlite_sequence WHERE name = 'penper'")
    num = cursor.fetchone()
    return num[1]

def delete_paper_from_db(id):
    cursor.execute("DELETE FROM penper WHERE id=?", (id,))
    con.commit()

def get_save_path(num):
    return "paper/pdf/" + str(num) + ".pdf"

def get_papers():
    cursor.execute("SELECT * FROM penper")
    return cursor.fetchall()

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

@route('/upload')
def upload_page():
    return template("upload", alert=None)

@get('/delete')
def delete_paper():
    id = request.query.id
    delete_paper_from_db(id)
    redirect("/")

@route('/')
def index():
    papers = get_papers()
    return template("index", papers=papers, alert=None)

@post("/")
def do_upload():
    paper_info = {}
    paper_info['pdf_data'] = request.files.get('paper','')
    paper_info['title'] = request.forms.get('title','')
    paper_info['auther'] = request.forms.get('auther','')
    paper_info['note'] = request.forms.get('note','')
    alert = {}
    if not paper_info['pdf_data'] or not paper_info['title'] or not paper_info['auther'] or not paper_info['note']:
        alert["message"] = "Please select PDF & input."
        alert["mode"] = "danger"
        return template("upload", alert=alert)

    filename = paper_info['pdf_data'].raw_filename
    if not filename.lower().endswith(('.pdf')):
        alert["message"] = "File extension not allowed!"
        alert["mode"] = "danger"
    else:
        num = save_db(paper_info)
        save_path = get_save_path(num)
        paper_info['pdf_data'].save(save_path)
        alert["message"] = "Success!"
        alert["mode"] = "primary"
        papers = get_papers()
    return template("index", papers=papers, alert=alert)

if __name__ == '__main__':
    run(host=HOST, port=PORTNUM, debug=True, reloader=True)
