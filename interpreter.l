%{
#include <stdlib.h>
#include "types.h"
#include "y.tab.h"
%}

%%
 
  /* variables */
[a-z]           {
                   yylval.sIndex = *yytext - 'a';
                   return VARIABLE;
                }

  /* integers */                 
[0-9]+          {
                   int value = atoi(yytext);
                   if(value >= 1000000){
                   yylval.iValue = value;
                   return INTEGER;
                   } else {
                    yyerror("I don't deal in change.");
                   }
                }

  /* operators */
[-()<>=+/*;{}.:!] return *yytext;

"plus"          return '+';
"minus"         return '-';
">="            return GE;
"more"          return GE;
"greater"       return GE;
"larger"        return GE;
"less"          return LE;
"fewer"         return LE;
"smaller"       return LE;
"<="            return LE;
"=="            return EQ;
"equal"         return EQ;
"!="            return NE;
"not"           return NOT;
"and"           return AND;
"or"            return OR;
"while"         return WHILE;
"if"            return IF;
"else"          return ELSE;
"print"         return PRINT;
"fact"          {   
                    yylval.iValue = 1;
                    return FACT;
                }
"lie"           {   
                    yylval.iValue = 0;
                    return LIE;
                }
"America is great." return END_STATEMENT;                

[ \t\n]+        ;      // Skip whitespaces.

.               yyerror("Unknown character.\n");

%%

int yywrap(void)
{
    return 1;
}
