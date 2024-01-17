%{
//    C code 
	 #include <stdio.h>
  #include <string.h>


  extern char Data_Type[50];

  extern void yyerror();
  extern int yylex();
  extern char* yytext;
  extern int yylineno;

  void storeDataType(char*);
  int isDuplicate(char*, char*);
  void storeIdentifier(char*,char*);
  void DuplicateIdentifierError(char*);
  char* retrieveDataType();
  void clearBuffers();
  int isValidAssignment(char*);
  void AssignmentError(char*);
  char* extractIdentifier(char[]);

  //For Array Identifiers
  int noOfArrayIdentifiers=0;
  char extractedIdentifier[50][50];
    
    
%}
%define parse.lac full
%define parse.error verbose

/* For better error reporting */


%union {
  int intval;
  char* dataType;
  char* strval;
  char charval;
}
/* Tokens declarations */


%token  COMMA   SINGLE_QUOTES   SEMI_COLON   EQUALS 
%token  BRACKET_OPEN  BRACKET_CLOSE_DOTS   BRACKET_CLOSE   CURLY_BRACE_OPEN  CURLY_BRACE_CLOSE BIG_BRACKET_OPEN  BIG_BRACKET_CLOSE

%token <charval>  CHARACTER_VALUE
%token <intval>   INTEGER_VALUE
%token <strval>   STRING_VALUE

%token T_PROGRAM
%token T_FUNCTION
%token T_CHAR
%token T_INTEGER
%token T_VARS
%token T_RETURN
%token T_END_FUNCTION
%token T_STARTMAIN
%token T_ENDMAIN
%token T_WHILE 
%token T_ENDWHILE
%token T_AND
%token T_OR
%token T_FOR
%token T_TO
%token T_STEP
%token T_ENDFOR
%token T_IF
%token T_THEN
%token T_ELSE
%token T_ENDIF 
%token T_ELSEIF
%token T_SWITCH
%token T_ENDSWITCH
%token T_DEFAULT
%token T_CASE
%token T_PRINT
%token T_BREAK

%token T_FORASSINGMENT

%token T_GRATERTHAN
%token T_LESSTHAN
%token T_EQ
%token T_DIF

%token T_PLUS
%token T_MUL
%token T_MINUS
%token T_DIV
%token T_POWER



%token <strval> T_IDENTIFIER ARRAY_IDENTIFIER
%token T_NEWLINE
//diloseis bison




%%

program : progStart T_NEWLINE func mainProg
		| progStart T_NEWLINE mainProg
;

progStart : T_PROGRAM T_IDENTIFIER 
;

func : funcHeader BRACKET_OPEN parameterList BRACKET_CLOSE T_NEWLINE funcBody funcEnd 
	 | funcHeader BRACKET_OPEN parameterList BRACKET_CLOSE T_NEWLINE funcBody funcEnd T_NEWLINE
;

funcHeader : T_FUNCTION T_IDENTIFIER  
;

parameterList : parameterDeclaration
				   | parameterList COMMA parameterDeclaration
;

parameterDeclaration : type T_IDENTIFIER
;
type : T_CHAR
        | T_INTEGER
;
funcBody : T_VARS T_NEWLINE varDeclaration commandList 
			|T_VARS varDeclaration commandList
			  | commandList
;
varDeclaration : type varList SEMI_COLON 
				| type varList SEMI_COLON T_NEWLINE
					| varDeclaration  type varList SEMI_COLON
;
varList : ARRAY_IDENTIFIER
			 | T_IDENTIFIER
			 | varList COMMA ARRAY_IDENTIFIER
			 | varList COMMA T_IDENTIFIER 
;		 		 
funcEnd : T_RETURN variable SEMI_COLON T_END_FUNCTION 
			 | T_RETURN STRING_VALUE SEMI_COLON  T_END_FUNCTION
			 |T_RETURN variable SEMI_COLON T_NEWLINE T_END_FUNCTION 
			 | T_RETURN STRING_VALUE SEMI_COLON T_NEWLINE T_END_FUNCTION
			 
;			 
mainProg : T_STARTMAIN mainBody T_ENDMAIN
		 | T_STARTMAIN T_NEWLINE mainBody T_ENDMAIN
;
mainBody : T_VARS varDeclaration commandList
		 | T_VARS T_NEWLINE varDeclaration commandList
              | commandList
;
commandList :  commands
				|commands T_NEWLINE
				| commandList commands T_NEWLINE
;				 
commands : assignmentStatement
			  | controlStatement
			  | loopStatement
			  | print
			  | break
;
assignmentStatement : variable EQUALS expression SEMI_COLON
;
expression : term 
				| expression T_PLUS term 
				| expression T_MINUS term
;				
term : primary
		  | term T_MUL primary 
    	  | term T_DIV primary
		  | term T_POWER primary
;		  
primary : variable
			 | INTEGER_VALUE 
			 | BRACKET_OPEN expression BRACKET_CLOSE
;			
loopStatement : whileStatement | forStatement
;
whileStatement : T_WHILE BRACKET_OPEN condition BRACKET_CLOSE T_NEWLINE commandList  T_ENDWHILE
;
condition : simpleCondition 
			   | condition T_AND simpleCondition
			   | condition T_OR simpleCondition
;
simpleCondition : variable logOperator INTEGER_VALUE
					 | variable logOperator variable
					 | INTEGER_VALUE logOperator INTEGER_VALUE
					 | INTEGER_VALUE logOperator variable
;
logOperator : T_LESSTHAN
				 | T_GRATERTHAN
				 | T_EQ
				 | T_DIF
;
forStatement : T_FOR variable T_FORASSINGMENT INTEGER_VALUE T_TO INTEGER_VALUE T_STEP INTEGER_VALUE T_NEWLINE commandList T_ENDFOR
;

controlStatement : ifStatement
				 | switchStatement
;			
ifStatement : ifthen commandList T_ENDIF
			| ifthen commandList T_ELSE T_NEWLINE commandList T_ENDIF
			| ifthen commandList elifSt T_ENDIF
			| ifthen commandList elifSt T_ELSE T_NEWLINE commandList T_ENDIF
;
ifthen : T_IF BRACKET_OPEN condition BRACKET_CLOSE T_THEN T_NEWLINE
;				 
elifSt : T_ELSEIF BRACKET_OPEN condition BRACKET_CLOSE T_THEN T_NEWLINE commandList 
		| elifSt T_ELSEIF BRACKET_OPEN condition BRACKET_CLOSE T_THEN T_NEWLINE commandList
;
switchStatement : T_SWITCH BRACKET_OPEN expression BRACKET_CLOSE T_NEWLINE cases T_ENDSWITCH
					 | T_SWITCH BRACKET_OPEN expression BRACKET_CLOSE T_NEWLINE cases T_DEFAULT T_NEWLINE commandList T_ENDSWITCH
;					 
cases : T_CASE BRACKET_OPEN expression BRACKET_CLOSE_DOTS T_NEWLINE commandList
		   | cases T_CASE BRACKET_OPEN expression BRACKET_CLOSE_DOTS T_NEWLINE commandList
;		   
print : T_PRINT BRACKET_OPEN STRING_VALUE BRACKET_CLOSE SEMI_COLON 
		   | T_PRINT BRACKET_OPEN STRING_VALUE  COMMA varList BRACKET_CLOSE SEMI_COLON
;		   
break : T_BREAK
;

			 
variable : T_IDENTIFIER
;

%%

int main(){

  yyparse();
  printf("No Errors!!\n");
  return 0;
}