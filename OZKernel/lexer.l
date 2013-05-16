%option yylineno
%{
#include "parser.tab.h"
#include <stdio.h>
%}

%%
local                   { return LOCAL; }
in                      { return IN; }
end                     { return END; }
skip                    { return SKIP; }
if                      { return IF; }
then                    { return THEN; }
else                    { return ELSE; }
case                    { return CASE; }
of                      { return OF; }
proc                    { return PROC; }
true                    { return TRUE; }
false                   { return FALSE; }
=                       { return ASSIGNMENT; }
\{                      { return LBRACE; }
\}                      { return RBRACE; }
\.                      { return DOT; }
\$                      { return DOLLAR; }
\(                      { return LPAR; }
\)                      { return RPAR; }
\:                      { return COLON; }
([a-z][a-zA-Z_0-9]*|'.+')      { return ATOM; }
([A-Z][a-zA-Z_0-9]*)|(`.+`)    { return ID; }
[0-9]+                  return INT;
[0-9]+\.[0-9]*          return FLOAT;
\n                      ;
[ \t]+                  /*ignore*/;
%%
