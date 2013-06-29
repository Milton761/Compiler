oz: oz.y oz.flex.c
	bison -d oz.y
	flex -o oz.lex.c oz.flex.c
	gcc oz.lex.c oz.tab.c -lm -lfl
