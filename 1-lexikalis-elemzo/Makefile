build: main.cpp lex.yy.cc
	g++ -o bead main.cpp lex.yy.cc

lex.yy.cc: lang.l
	flex lang.l

clean:
	rm -f lex.yy.cc bead