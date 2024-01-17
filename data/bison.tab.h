/* A Bison parser, made by GNU Bison 3.7.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_BISON_TAB_H_INCLUDED
# define YY_YY_BISON_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    COMMA = 258,                   /* COMMA  */
    SINGLE_QUOTES = 259,           /* SINGLE_QUOTES  */
    SEMI_COLON = 260,              /* SEMI_COLON  */
    EQUALS = 261,                  /* EQUALS  */
    BRACKET_OPEN = 262,            /* BRACKET_OPEN  */
    BRACKET_CLOSE_DOTS = 263,      /* BRACKET_CLOSE_DOTS  */
    BRACKET_CLOSE = 264,           /* BRACKET_CLOSE  */
    CURLY_BRACE_OPEN = 265,        /* CURLY_BRACE_OPEN  */
    CURLY_BRACE_CLOSE = 266,       /* CURLY_BRACE_CLOSE  */
    BIG_BRACKET_OPEN = 267,        /* BIG_BRACKET_OPEN  */
    BIG_BRACKET_CLOSE = 268,       /* BIG_BRACKET_CLOSE  */
    CHARACTER_VALUE = 269,         /* CHARACTER_VALUE  */
    INTEGER_VALUE = 270,           /* INTEGER_VALUE  */
    STRING_VALUE = 271,            /* STRING_VALUE  */
    T_PROGRAM = 272,               /* T_PROGRAM  */
    T_FUNCTION = 273,              /* T_FUNCTION  */
    T_CHAR = 274,                  /* T_CHAR  */
    T_INTEGER = 275,               /* T_INTEGER  */
    T_VARS = 276,                  /* T_VARS  */
    T_RETURN = 277,                /* T_RETURN  */
    T_END_FUNCTION = 278,          /* T_END_FUNCTION  */
    T_STARTMAIN = 279,             /* T_STARTMAIN  */
    T_ENDMAIN = 280,               /* T_ENDMAIN  */
    T_WHILE = 281,                 /* T_WHILE  */
    T_ENDWHILE = 282,              /* T_ENDWHILE  */
    T_AND = 283,                   /* T_AND  */
    T_OR = 284,                    /* T_OR  */
    T_FOR = 285,                   /* T_FOR  */
    T_TO = 286,                    /* T_TO  */
    T_STEP = 287,                  /* T_STEP  */
    T_ENDFOR = 288,                /* T_ENDFOR  */
    T_IF = 289,                    /* T_IF  */
    T_THEN = 290,                  /* T_THEN  */
    T_ELSE = 291,                  /* T_ELSE  */
    T_ENDIF = 292,                 /* T_ENDIF  */
    T_ELSEIF = 293,                /* T_ELSEIF  */
    T_SWITCH = 294,                /* T_SWITCH  */
    T_ENDSWITCH = 295,             /* T_ENDSWITCH  */
    T_DEFAULT = 296,               /* T_DEFAULT  */
    T_CASE = 297,                  /* T_CASE  */
    T_PRINT = 298,                 /* T_PRINT  */
    T_BREAK = 299,                 /* T_BREAK  */
    T_FORASSINGMENT = 300,         /* T_FORASSINGMENT  */
    T_GRATERTHAN = 301,            /* T_GRATERTHAN  */
    T_LESSTHAN = 302,              /* T_LESSTHAN  */
    T_EQ = 303,                    /* T_EQ  */
    T_DIF = 304,                   /* T_DIF  */
    T_PLUS = 305,                  /* T_PLUS  */
    T_MUL = 306,                   /* T_MUL  */
    T_MINUS = 307,                 /* T_MINUS  */
    T_DIV = 308,                   /* T_DIV  */
    T_POWER = 309,                 /* T_POWER  */
    T_IDENTIFIER = 310,            /* T_IDENTIFIER  */
    ARRAY_IDENTIFIER = 311,        /* ARRAY_IDENTIFIER  */
    T_NEWLINE = 312                /* T_NEWLINE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 36 "bison.y"

  int intval;
  char* dataType;
  char* strval;
  char charval;

#line 128 "bison.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_BISON_TAB_H_INCLUDED  */
