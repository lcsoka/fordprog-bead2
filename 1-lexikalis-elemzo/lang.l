%option noyywrap c++ yylineno

%{
#include <iostream>
#include <cstdlib>
%}

LETTER      [a-zA-Z]
DIGIT       [0-9]
WS          [ \t\n]
COMMENT     ^\*.*$
IDENTIFIER  {LETTER}({LETTER}|{DIGIT}|_)*

%%
{COMMENT}       // std::cout << "komment: " << YYText() << std::endl;

"PROGRAM"       std::cout << "kulcsszo: " << YYText() << std::endl;
"DATA"          std::cout << "kulcsszo: " << YYText() << std::endl;
"TYPE"          std::cout << "kulcsszo: " << YYText() << std::endl;
"I"             std::cout << "tipus: " << YYText() << std::endl;
"B"             std::cout << "tipus: " << YYText() << std::endl;
"TRUE"          std::cout << "kulcsszo: " << YYText() << std::endl;
"FALSE"         std::cout << "kulcsszo: " << YYText() << std::endl;
"AND"           std::cout << "kulcsszo: " << YYText() << std::endl;
"OR"            std::cout << "kulcsszo: " << YYText() << std::endl;
"NOT"           std::cout << "kulcsszo: " << YYText() << std::endl;
"MOVE"          std::cout << "kulcsszo: " << YYText() << std::endl;
"TO"            std::cout << "kulcsszo: " << YYText() << std::endl;
"READ"          std::cout << "kulcsszo: " << YYText() << std::endl;
"WRITE"         std::cout << "kulcsszo: " << YYText() << std::endl;
"ADD"           std::cout << "kulcsszo: " << YYText() << std::endl;
"SUBTRACT"      std::cout << "kulcsszo: " << YYText() << std::endl;
"MULTIPLY"      std::cout << "kulcsszo: " << YYText() << std::endl;
"DIVIDE"        std::cout << "kulcsszo: " << YYText() << std::endl;
"MOD"           std::cout << "kulcsszo: " << YYText() << std::endl;
"WHILE"         std::cout << "kulcsszo: " << YYText() << std::endl;
"ENDWHILE"      std::cout << "kulcsszo: " << YYText() << std::endl;
"IF"            std::cout << "kulcsszo: " << YYText() << std::endl;
"ELSE"          std::cout << "kulcsszo: " << YYText() << std::endl;
"ENDIF"         std::cout << "kulcsszo: " << YYText() << std::endl;

{DIGIT}+        std::cout << "szam: " << YYText() << std::endl;
{IDENTIFIER}    std::cout << "azonosito: " << YYText() << std::endl;

"("             std::cout << "zarojel: " << YYText() << std::endl;
")"             std::cout << "zarojel: " << YYText() << std::endl;

"<"             std::cout << "operator: " << YYText() << std::endl;
">"             std::cout << "operator: " << YYText() << std::endl;
"="             std::cout << "operator: " << YYText() << std::endl;
","             std::cout << "separator: " << YYText() << std::endl;
"."             std::cout << "separator: " << YYText() << std::endl;
":"             std::cout << "separator: " << YYText() << std::endl;

{WS}+       // std::cout << "whitespace" << std::endl;
.           {
                std::cerr << lineno() << ": Lexikalis hiba." << std::endl;
                exit(1);
            }

%%
