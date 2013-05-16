%{
#include <stdio.h>
#include <math.h>
extern int yylineno;
int yylex (void);
void yyerror(const char *str){
        fprintf(stderr,"\nERROR line %d: %s\n", yylineno, str);
}
 
%}

%token INT 
%token FLOAT
%token ID
%token ATOM
%token SKIP
%token LOCAL
%token IN
%token END
%token IF
%token THEN
%token ELSE
%token CASE
%token OF
%token PROC
%token TRUE
%token FALSE
%token ASSIGNMENT
%token LBRACE
%token RBRACE
%token DOT
%token DOLLAR
%token LPAR
%token RPAR
%token COLON

%%
statements: statement
       | statement statements 
statement: SKIP
         | ID ASSIGNMENT ID
         | ID ASSIGNMENT value
/*         | statement statement {printf("composition\n");} */
         | LOCAL ID IN statements END
         | IF ID THEN statements ELSE statements END
         | LBRACE procName params RBRACE
         | CASE ID OF record THEN statements ELSE statements END 

procName: ID | fieldSelector

fieldSelector: ID DOT ATOM

value: 
     procedure | 
     record | 
     number

procedure: PROC LBRACE DOLLAR params RBRACE statement END

params: ID
      | params ID

record: literal
      | literal LPAR regs RPAR

regs: reg
    | regs reg

reg: feature COLON ID

feature: INT | ATOM

literal: ATOM | bool

bool: TRUE | FALSE

number: INT | FLOAT 

%%
 
int yywrap(){
        return 1;
} 

main(){
   return yyparse();
}
