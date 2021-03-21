%{
#include <stdio.h>
extern FILE* yyin;
int yylex(void);
%}

%%
("Var")              	printf("KEY_WORD ");
("Begin")               printf("KEY_BEGIN ");
("End")                 printf("KEY_END ");
[0-9]+ 		        printf("CONSTANT ");
([a-zA-Z])+ 	        printf("IDENTIFIER ");
(\*){1} 		printf("MULTIPLY ");
(\/){1} 		printf("DIVIDE ");
(\,){1} 		printf("COMMA ");
(\=){1} 		printf("ASSIGN ");
(\-){1} 		printf("MINUS ");
(\+){1} 		printf("PLUS ");
(\(){1} 		printf("OPEN_BRACKET ");
(\)){1} 		printf("CLOSE_BRACKET ");
\n
[ \t]+
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("prog.txt","r");
    yylex();
    fclose(yyin);
    return 0;
} 