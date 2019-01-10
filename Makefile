all:
	mkdir paper
	mkdir paper/pdf
	mkdir paper/memo
	mkdir paper/html
	python3 DB/init_db.py
	chmod 775 DB/penper.db

clean:
	rm -rf paper
	rm DB/penper.db
