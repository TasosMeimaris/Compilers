%{
    #include <string.h>
    #include <stdlib.h>
    #include "bison.tab.h"
    void extern yyerror(char*);
    void InvalidToken();
%}

whitespace      [ \t\r\v\f]
linefeed        \n

%%
"PROGRAM"      {return T_PROGRAM;}
"FUNCTION"     {return T_FUNCTION;}
"CHAR"         {return T_CHAR;}
"INTEGER"      {return T_INTEGER;}
"VARS"         {return T_VARS;}
"RETURN"       {return T_RETURN;}
"END_FUNCTION" {return T_END_FUNCTION;}
"STARTMAIN"    {return T_STARTMAIN;}
"ENDMAIN"      {return T_ENDMAIN;}
"WHILE"        {return T_WHILE;} 
"ENDWHILE"     {return T_ENDWHILE;}
"AND"          {return T_AND;}
"OR"           {return T_OR;}
"FOR"          {return T_FOR;}
"TO"           {return T_TO;}
"STEP"         {return T_STEP;}
"ENDFOR"       {return T_ENDFOR;}
"IF"           {return T_IF;}
"ELSE"         {return T_ELSE;}
"THEN"         {return T_THEN;}
"ENDIF"        {return T_ENDIF;} 
"ELSEIF"       {return T_ELSEIF;}
"SWITCH"       {return T_SWITCH;}
"ENDSWITCH"    {return T_ENDSWITCH;}
"DEFAULT:"     {return T_DEFAULT;}
"CASE"         {return T_CASE;}
"PRINT"        {return T_PRINT;}
"BREAK;"       {return T_BREAK;}

{linefeed}     {yylineno++; return T_NEWLINE;}

"+"            {return T_PLUS;}
"-"            {return T_MINUS;}
"*"            {return T_MUL;}
"/"            {return T_DIV;}
"^"            {return T_POWER;}
"<"            {return T_LESSTHAN;}
">"            {return T_GRATERTHAN;} 
"=="           {return T_EQ;}
"!="           {return T_DIF;}
":="           {return T_FORASSINGMENT;}
"):"           {return BRACKET_CLOSE_DOTS;}
"'"            {return SINGLE_QUOTES;}
","            {return COMMA;}
";"            {return SEMI_COLON;}
"="            {return EQUALS;}
"("            {return BRACKET_OPEN;}
")"            {return BRACKET_CLOSE;}
"{"            {return CURLY_BRACE_OPEN;}
"}"            {return CURLY_BRACE_CLOSE;}
"["            {return BIG_BRACKET_OPEN;}
"]"            {return BIG_BRACKET_CLOSE;}

"%".*"\n"                                       
[\'][a-zA-Z][\']                                {yylval.charval = yytext[1];    return CHARACTER_VALUE;}
[-+]?[0-9]+                                     {yylval.intval = atoi(yytext);  return INTEGER_VALUE;}

[a-zA-Z][_a-zA-Z0-9]*(\[[0-9]+\])+              {yylval.strval = strdup(yytext); return ARRAY_IDENTIFIER;}
[a-zA-Z][_a-zA-Z0-9]*                           {yylval.dataType = strdup(yytext); return T_IDENTIFIER;}


\"(\\.|[^"])*\"                                 {yylval.strval = strdup(yytext); return STRING_VALUE;}

{whitespace}                                    ;
.                                               {InvalidToken();}

%%


int yywrap(void){
    return 1;
}

void yyerror(char *s) {
    fprintf(stderr, "\nERROR ON LINE %d : \n %s\n", yylineno, s);
    exit(0);
}

void InvalidToken(){
    printf("ERROR ON LINE %d : \n Invalid Token %s\n", yylineno,yytext);
    exit(0);
}
