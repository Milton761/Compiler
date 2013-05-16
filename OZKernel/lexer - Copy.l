%{
#include "parser.tab.h"
#include <stdio.h>
%}

%%
local                   { printf("LOCAL\n"); return LOCAL; }
in                      { printf("IN\n"); return IN; }
end                     { printf("END\n"); return END; }
skip                    { printf("SKIP\n"); return SKIP; }
if                      { printf("IF\n"); return IF; }
then                    { printf("THEN\n"); return THEN; }
else                    { printf("ELSE\n"); return ELSE; }
case                    { printf("CASE\n"); return CASE; }
of                      { printf("OF\n"); return OF; }
proc                    { printf("PROC\n"); return PROC; }
true                    { printf("TRUE\n"); return TRUE; }
false                   { printf("FALSE\n"); return FALSE; }
[a-z][a-zA-Z_0-9]*      { printf("atom %s\n", yytext); return ATOM; }
[A-Z][a-zA-Z_0-9]*      { printf("ID\n"); return ID; }
[0-9]+                  return INT;
[0-9]+\.[0-9]*          return FLOAT;
\n                      printf("\n");
[ \t]+                  /*ignore*/;
%%
