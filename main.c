
#include <stdio.h>
#include <stdlib.h>
#include "statementtype.h"
#include "stack.h"
#include "map.h"
extern int yyparse();
extern FILE *yyin;
extern FILE *yyout;



int int_comp(void *a, void* b)
{
	//printf("Comparando %d %d",*(int *)a,*(int *)b);
	if(*(int *)a == *(int*)b)
		return 1;
	
	return 0;
}

int main(int argc,char *argv[])
{
	if(argc<2)
	  {
	   printf("Please specify the input file\n");
	   exit(0);
	  }
	 FILE *fp=fopen(argv[1],"r");
	 if(!fp)
	 {
	  printf("couldn't open file for reading\n");
	  exit(0);
	 }
	
	/*Stack * stack = Stack_new();
	push(stack, Statement_new(S_SKIP,NULL));
	push(stack, Statement_new(S_PROC,NULL));
	push(stack, Statement_new(S_IF,NULL));
	pop(stack);
	push(stack, Statement_new(S_SEQ,NULL));

	printStack(stack);

	Stack_delete(stack);*/

	Map * map = Map_new();
	map->comp = int_comp;
	int * a = (int*)malloc(sizeof(int));
	*a = 1;
	int * b = (int*)malloc(sizeof(int));
	*b = 10;
	Map_add(map,a,b);

	int * c = (int*)malloc(sizeof(int));
	*c = 2;
	int * d = (int*)malloc(sizeof(int));
	*d = 20;
	Map_add(map,c,d);
	
	int ok ;
	int buscar = 1;
	int r = *(int*)Map_get(map,&buscar,&ok);
	printf("Result: %d\n",r);

	  yyin=fp;
	  yyparse();
	 fclose(fp);
	

	return 0;
}


