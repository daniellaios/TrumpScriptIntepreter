%{
#include <stdlib.h>
#include "types.h"
#include "y.tab.h"
%}

%%
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
[-()<>=+/*;{}.:!?] return *yytext;

"plus"          return '+';
"minus"         return '-';
">="            return GE;
"more"          return '>';
"greater"       return '>';
"larger"        return '>';
"less"          return '<';
"fewer"         return '<';
"smaller"       return '<';
"<="            return LE;
"=="            return EQ;
"equal"         return EQ;
"!="            return NE;
"not"           return NOT;
"and"           return AND;
"or"            return OR;
"as long as"    return WHILE;
"if"            return IF;
"else"          return ELSE;
"print"         return PRINT;
"prints"        return PRINTS;
"is"            return IS;
"are"           return IS;
"make"          return MAKE;
"china"         return CHINA;
"fact"          {   
                    yylval.iValue = 1;
                    return FACT;
                }
"lie"           {   
                    yylval.iValue = 0;
                    return LIE;
                }
"America is great." return END_STATEMENT;    

 /* variables */
[a-z]+           {
                   //yylval.sIndex = *yytext - 'a';
                   yylval.variableName = strdup(yytext);
                   return VARIABLE;
                }
"hillary"       {
                  yylval.variableName = strdup(yytext);
                  return VARIABLE;
                }

[ \t\n]+        ;      // Skip whitespaces.
\".+\"          {
                  yylval.str = strdup(yytext);
                  return STRING;
                }
.               yyerror("Unknown character.\n");

%%

int yywrap(void)
{
    return 1;
}
