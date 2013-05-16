%{
#define YYSTYPE double
#include "oz.tab.h"
#include <stdlib.h>
%}

espacio [ \t\n]+






%%

{espacio} { }
[0-9]+ { yylval=atoi(yytext); 
 return NUMI;
}


"skip" return SKIP;
"local" return LOCAL;
"in" return IN;
"end" return END;
"=" return '=';
"if" return IF;
"else" return ELSE;
"then" return THEN;
"case" return CASE;
"of" return OF;
"." return PUNTO;
"=" return IGUAL;
"{" return LLAVEI;
"}" return LLAVED;
"(" return PARI;
")" return PARD;
":" return DOSPUNTOS;

"true" return TRUE;
"false" return FALSE;

([a-z][a-zA-Z_0-9]*|'.+')      { return ATOM; }
[A-Z]+[a-z]*  return ID;









