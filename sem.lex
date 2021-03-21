%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
#ifndef YYSTYPE
#define YYSTYPE char*
#endif
#define INTEGER 288
%}

%%

("Var")                 yylval=strdup(yytext);return KEY_WORD;
("Begin")               yylval=strdup(yytext);return KEY_BEGIN;
("End")                 yylval=strdup(yytext);return KEY_END;
[0-9]+ 			yylval=strdup(yytext);return CONSTANT;
([a-zA-Z])+ 	        yylval=strdup(yytext);return IDENTIFIER;
(\*){1} 		yylval=strdup(yytext);return MULTIPLY;
(\/){1} 		yylval=strdup(yytext);return DIVIDE;
(\-){1} 		yylval=strdup(yytext);return MINUS;
(\+){1} 		yylval=strdup(yytext);return PLUS;
(\,){1} 		yylval=strdup(yytext);return COMMA;
(\=){1} 		yylval=strdup(":=");return ASSIGN;
(\(){1}			yylval=strdup(yytext);return OPEN_BRACKET;
(\)){1} 		yylval=strdup(yytext);return CLOSE_BRACKET;
\n
[ \t]+
%%

int yywrap()

{

return 1;

}