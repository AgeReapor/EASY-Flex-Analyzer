%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
%}

STRING              '[^']*'
COMMENT             \/\/.*$
WHITESPACE          [ \t\f]*
NEWLINE             [\n\r\t\f]*
MATH_NOTATION       [⌊⌋⌈⌉]|mod|log_([0-9]+([.][0-9]*)?|[.][0-9]+)
NUMBER              -?([0-9]+([.][0-9]*)?|[.][0-9]+)
ARITHMETIC_OP       [+\-\/\*^]
LOGICAL_OP          and|or|not
RELATIONAL_OP       ==|<=|>=|!=|[<>]
ASSIGNMENT          =
KEYWORD             go|to|exit|if|then|else|case|endcase|while|do|endwhile|repeat|until|loop|forever|for|by|do|input|output|array|node|call|return|stop|end|procedure
OPEN_SQR_BRACKET    \[
CLOSE_SQR_BRACKET   \]
COLON               :
BOOLEAN             true|false
COMMA               ,
OPEN_PAREN          \(
CLOSE_PAREN         \)
IDENTIFIER          [_a-zA-Z][_a-zA-Z0-9]*
%%

{STRING}            printf("<%s,%s>\n", "String", yytext);
{COMMENT}           // ignore comments
{WHITESPACE}        // ignore whitespace except newline
{NEWLINE}           printf("<%s, '%s'>\n", "Newline", "\\n");
{MATH_NOTATION}     printf("<%s, '%s'>\n", "Math_Notation", yytext);
{NUMBER}            printf("<%s, %s>\n", "Number", yytext);
{ARITHMETIC_OP}     printf("<%s, '%s'>\n", "Arithmetic_Op", yytext);
{LOGICAL_OP}        printf("<%s, '%s'>\n", "Logical_Op", yytext);
{RELATIONAL_OP}     printf("<%s, '%s'>\n", "Relational_Op", yytext);
{ASSIGNMENT}        printf("<%s, '%s'>\n", "Assignment", "=");
{KEYWORD}           printf("<%s, %s>\n", "Keyword", yytext);
{OPEN_SQR_BRACKET}  printf("<%s, '%s'>\n", "Open_Sqr_Bracket", "[");
{CLOSE_SQR_BRACKET} printf("<%s, '%s'>\n", "Close_Sqr_Bracket", "]");
{COLON}             printf("<%s, '%s'>\n", "Colon", ":");
{BOOLEAN}           printf("<%s, %s>\n", "Boolean", yytext);
{COMMA}             printf("<%s, '%s'>\n", "Comma", ",");
{OPEN_PAREN}        printf("<%s, '%s'>\n", "Open_Paren", "(");
{CLOSE_PAREN}       printf("<%s, '%s'>\n", "Close_Paren", ")");
{IDENTIFIER}        printf("<%s, %s>\n", "Identifier", yytext);
                
%%

int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}
