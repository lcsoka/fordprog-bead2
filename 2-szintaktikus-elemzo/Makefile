COMPILERNAME=lang

all: $(COMPILERNAME)
	-

clean:
	rm -rf $(COMPILERNAME) $(SCANNERTEST) lex.yy.cc Parserbase.h parse.cc *~

lex.yy.cc: $(COMPILERNAME).l
	flex $(COMPILERNAME).l

parse.cc: $(COMPILERNAME).y
	bisonc++ $(COMPILERNAME).y

$(COMPILERNAME): main.cpp lex.yy.cc parse.cc
	g++ -o$(COMPILERNAME) main.cpp parse.cc lex.yy.cc
