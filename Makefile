all:
	mkdir paper
	mkdir paper/pdf
	mkdir paper/memo
	mkdir paper/html

clean:
	rm -rf paper
	rm DB/penper.db
