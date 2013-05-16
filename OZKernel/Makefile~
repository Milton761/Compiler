main.exe: parser.o lexer.o
	gcc parser.o lexer.o -o main.exe
lexer.o: lex.yy.c
	gcc -c lex.yy.c -o lexer.o
lex.yy.c: lexer.l parser.tab.h
	flex lexer.l
parser.tab.h: parser.y
	bison -d parser.y
parser.o: parser.tab.c
	gcc -c parser.tab.c -o parser.o
parser.tab.c: parser.y
	bison parser.y
