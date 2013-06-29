
#include <stdio.h>
#include <stdlib.h>

extern int yyparse();
extern FILE *yyin;
extern FILE *yyout;


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
	
	  yyin=fp;
	  yyparse();
	 fclose(fp);
	

	return 0;
}


