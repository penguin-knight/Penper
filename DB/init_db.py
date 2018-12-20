import sqlite3

db_path = 'penper.db'

# Connect database & create cursor
con = sqlite3.connect(db_path)
cursor = con.cursor()

cursor.executescript("""
DROP TABLE IF EXISTS paper;
CREATE TABLE penper(id INTEGER PRIMARY KEY, title TEXT)
""")

print("create penper.db")
con.commit()
con.close()
