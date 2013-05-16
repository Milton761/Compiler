
/* Reverse polish notation calculator. */

%{
#define YYSTYPE double
#include <math.h>
#include <ctype.h>
#include <stdio.h>
%}

%token NUMI
%token ID
%token NUMF
%token SKIP
%token LOCAL
%token IN
%token END
%token IF
%token THEN
%token ELSE
%token IGUAL
%token LLAVEI
%token LLAVED
%token ATOM
%token TRUE
%token FALSE
%token PARI
%token PARD
%token DOSPUNTOS
%token CASE
%token OF
%token PUNTO


%% /* Grammar rules and actions follow */


st1: st2 
	| st2 st1     

;

st2:  SKIP            {    printf("skip");      }
        | ID IGUAL value     { $$ = $1 ;  printf("ID con value");   }       
	| ID IGUAL ID	{ $$ = $1 ;  printf("ID con ID");    }	
        | LOCAL ID  IN  st1 END     {printf("local ");   }
	| IF ID THEN st1 ELSE st1 END  {printf("if");}
	|  LLAVEI nombreProc parametros LLAVED
        | CASE ID OF record THEN st1 ELSE st1 END 


;


nombreProc: ID | fieldSelector;

fieldSelector: ID PUNTO ATOM;

value:

	NUMI;

record: literal
      | literal PARI regs PARD;

regs: reg
    | regs reg;

parametros: ID
      | parametros ID;

reg: feature DOSPUNTOS ID;

feature: NUMI | ATOM;

literal: ATOM | bool;

bool:
	TRUE | FALSE;	
%%




main ()
{
  yyparse ();
}



yyerror (s)  /* Called by yyparse on error */
     char *s;
{
  printf ("%s\n", s);
}
