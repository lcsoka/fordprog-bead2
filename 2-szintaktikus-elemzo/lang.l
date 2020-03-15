%option noyywrap c++ yylineno

%{
#include "Parserbase.h"
%}

LETTER      [a-z]
DIGIT       [0-9]
WS          [ \t\n]
COMMENT     ^\*.*$
IDENTIFIER  {LETTER}({LETTER}|{DIGIT}|_)*

%%
{COMMENT}       // std::cout << "komment: " << YYText() << std::endl;

"PROGRAM"       return Parser::PROGRAM;
"DATA"          return Parser::DATA;
"TYPE"          return Parser::TYPE;
"I"             return Parser::I;
"B"             return Parser::B;
"TRUE"          return Parser::TRUE;
"FALSE"         return Parser::FALSE;
"AND"           return Parser::AND;
"OR"            return Parser::OR;
"NOT"           return Parser::NOT;
"MOVE"          return Parser::MOVE;
"TO"            return Parser::TO;
"FROM"          return Parser::FROM;
"BY"            return Parser::BY;
"READ"          return Parser::READ;
"WRITE"         return Parser::WRITE;
"ADD"           return Parser::ADD;
"SUBTRACT"      return Parser::SUBTRACT;
"MULTIPLY"      return Parser::MULTIPLY;
"DIVIDE"        return Parser::DIVIDE;
"MOD"           return Parser::MOD;
"WHILE"         return Parser::WHILE;
"ENDWHILE"      return Parser::ENDWHILE;
"IF"            return Parser::IF;
"ELSE"          return Parser::ELSE;
"ENDIF"         return Parser::ENDIF;

{DIGIT}+        return Parser::NATURAL_LITERAL;
{IDENTIFIER}    return Parser::IDENTIFIER;

"("             return Parser::LEFT_PARENTHESIS;
")"             return Parser::RIGHT_PARENTHESIS;

"<"             return Parser::LESS_THAN;
">"             return Parser::GREATER_THAN;
"="             return Parser::EQUAL;
","             return Parser::COMMA;
"."             return Parser::LINE_END;
":"             return Parser::COLON;

{WS}+       // std::cout << "whitespace" << std::endl;
.           {
                std::cerr << lineno() << ": Lexikalis hiba." << std::endl;
                exit(1);
            }

%%
