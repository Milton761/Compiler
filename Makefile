oz: oz.y oz.flex.c
	bison -d oz.y
	flex -o oz.lex.c oz.flex.c
	gcc  -c oz.tab.c 
	gcc -c oz.lex.c 
	gcc -c main.c
	gcc -o main *.o -lm -lfl

