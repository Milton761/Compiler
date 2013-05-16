%{
#include <stdio.h>
#include <math.h>
int yylex (void);
void yyerror(const char *str){
        fprintf(stderr,"error: %s\n",str);
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

%%
program: statement
       | statement program {printf("composition\n");}
statement: SKIP
         | ID '=' ID
         | ID '=' value
/*         | statement statement {printf("composition\n");} */
         | LOCAL ID IN statement END
         | IF ID THEN statement ELSE statement END
         | '{' ID params '}'
         | CASE ID OF record THEN statement ELSE statement END 

value: 
     procedure | 
     record | 
     number

procedure: PROC '{' '$' params '}' statement END       {printf("procedure %s\n", $1);}

params: ID
      | params ID

record: literal
      | literal '(' regs ')'

regs: reg
    | regs reg

reg: feature ':' ID

feature: INT | ATOM

literal: ATOM | bool

bool: TRUE | FALSE  { printf("bool %s\n", $1); }

number: INT | FLOAT     { printf("number %s\n", $1); }

%%
 
int yywrap(){
        return 1;
} 

main(){
   return yyparse();
}
