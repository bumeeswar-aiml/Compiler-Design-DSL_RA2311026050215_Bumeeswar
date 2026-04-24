%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%

"print"                 { return PRINT; }

[0-9]+                  { yylval.num = atoi(yytext); return NUMBER; }

[a-zA-Z_][a-zA-Z0-9_]*  { yylval.id = strdup(yytext); return ID; }

"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return MUL; }
"/"                     { return DIV; }

"="                     { return ASSIGN; }

";"                     { return SEMI; }

"("                     { return LPAREN; }
")"                     { return RPAREN; }

[ \t\r\n]+              ;

. { printf("Unknown Character: %s\n", yytext); }

%%

int yywrap()
{
    return 1;
}
