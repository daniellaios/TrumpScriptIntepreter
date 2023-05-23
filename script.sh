#! /bin/sh
lex interpreter.l
yacc -d interpreter.y
gcc y.tab.c lex.yy.c -ly -ll
