%{
#include <stdio.h>
#include <stdlib.h>
#include "ast.h"

int yylex();
void yyerror(const char *s);
%}

%union {
    int num;
    char* id;
    struct Node* node;
}

%token <num> NUMBER
%token <id> ID
%token PRINT
%token PLUS MINUS MUL DIV ASSIGN SEMI LPAREN RPAREN

%type <node> expr stmt

%%

program:
      program stmt
    | stmt
;

stmt:
      ID ASSIGN expr SEMI
        {
            printf("Assignment Statement\n");
            generateCode($3);
        }

    | PRINT LPAREN expr RPAREN SEMI
        {
            printf("Print Statement\n");
            generateCode($3);
        }
;

expr:
      expr PLUS expr { $$ = createNode("+",$1,$3); }
    | expr MINUS expr { $$ = createNode("-",$1,$3); }
    | expr MUL expr { $$ = createNode("*",$1,$3); }
    | expr DIV expr { $$ = createNode("/",$1,$3); }

    | NUMBER { $$ = createNumNode($1); }
    | ID { $$ = createIdNode($1); }

    | LPAREN expr RPAREN { $$ = $2; }
;

%%

void yyerror(const char *s)
{
    printf("Syntax Error: %s\n", s);
}

int main()
{
    printf("Mini Compiler Running...\n");
    yyparse();
    return 0;
}
