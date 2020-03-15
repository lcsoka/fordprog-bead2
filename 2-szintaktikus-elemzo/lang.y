%baseclass-preinclude <iostream>
%lsp-needed

%token PROGRAM DATA
%token TYPE
%token I B
%token TRUE FALSE
%token MOVE
%token TO
%token FROM
%token BY
%token READ WRITE
%token IF ELSE ENDIF
%token WHILE ENDWHILE
%token IDENTIFIER
%token LEFT_PARENTHESIS RIGHT_PARENTHESIS
%token COMMA
%token LINE_END
%token COLON
%token NATURAL_LITERAL

%left AND OR NOT
%left EQUAL
%left LESS_THAN GREATER_THAN
%left ADD SUBTRACT
%left MULTIPLY DIVIDE MOD

%%

start: program 
    {
        std::cout << "start -> program" << std::endl;
    }
;

program: header declaration_block body 
    {
        std::cout << "program -> header declaration_block body" << std::endl;
    }
;

header: PROGRAM IDENTIFIER LINE_END
    {
        std::cout << "header -> PROGRAM IDENTIFIER LINE_END" << std::endl;
    }
;

declaration_block:
    {
        std::cout << "declaration_block -> \"\"" << std::endl;
    }
|
DATA COLON declaration declarations
    {
        std::cout << "declaration_block -> DATA COLON declaration declarationsa" << std::endl;
    }
;

declarations: 
    {
        std::cout << "declarations -> \"\"" << std::endl;
    }
|
declaration more_declaration LINE_END
    {
        std::cout << "declarations -> declaration declarations" << std::endl;
    }
;

more_declaration:
    {
        std::cout << "more_declaration -> \"\"" << std::endl;
    }
|
COMMA declaration more_declaration
    {
        std::cout << "more_declaration -> COMMA declaration more_declaration" << std::endl;
    }
;

declaration: IDENTIFIER TYPE type
    {
        std::cout << "declaration -> IDENTIFIER TYPE type" << std::endl;
    }
;

type:
I
    {
        std::cout << "type -> I" << std::endl;
    }
B
    {
        std::cout << "type -> B" << std::endl;
    }
;

body: expressions
    {
        std::cout << "body -> expressions" << std::endl;
    }
;

expressions:
    {
        std::cout << "expressions -> \"\"" << std::endl;
    }
|
expression expressions
    {
        std::cout << "expressions -> expression expressions" << std::endl;
    }
;

expression:
read
    {
        std::cout << "expressions -> read" << std::endl;
    }
|
write
    {
        std::cout << "expressions -> write" << std::endl;
    }
|
assignment
    {
        std::cout << "expressions -> assignment" << std::endl;
    }
|
while_loop
    {
        std::cout << "expressions -> while_loop" << std::endl;
    }
|
if_statement
    {
        std::cout << "expressions -> if_statement" << std::endl;
    }
;

read: READ TO IDENTIFIER LINE_END
    {
        std::cout << "read -> READ TO IDENTIFIER LINE_END" << std::endl;
    }
;

write: WRITE expr LINE_END
    {
        std::cout << "write -> WRITE expr" << std::endl;
    }
;

assignment: MOVE expr TO IDENTIFIER LINE_END
    {
        std::cout << "write -> MOVE expr TO IDENTIFIER LINE_END" << std::endl;
    }
;

while_loop: WHILE expr LINE_END expressions ENDWHILE LINE_END
    {
        std::cout << "while_loop -> WHILE expr LINE_END expressions ENDWHILE LINE_END" << std::endl;
    }
;

if_statement: IF expr LINE_END if_second_half
    {
        std::cout << "if_statement -> IF expr LINE_END if_second_half" << std::endl;
    }
;

if_second_half:
expressions ENDIF LINE_END
    {
        std::cout << "if_second_half -> expressions ENDIF LINE_END" << std::endl;
    }
|
expressions ELSE expressions ENDIF LINE_END
    {
        std::cout << "if_second_half -> expressions ELSE expressions ENDIF LINE_END" << std::endl;
    }
;

expr:
TRUE
    {
        std::cout << "expr -> TRUE" << std::endl;
    }
|
FALSE
    {
        std::cout << "expr -> FALSE" << std::endl;
    }
|
IDENTIFIER
    {
        std::cout << "expr -> IDENTIFIER" << std::endl;
    }
|
NATURAL_LITERAL
    {
        std::cout << "expr -> NATURAL_LITERAL" << std::endl;
    }
|
expr EQUAL expr
    {
        std::cout << "expr -> expr EQUAL expr" << std::endl;
    }
|
LEFT_PARENTHESIS expr RIGHT_PARENTHESIS
    {
        std::cout << "expr -> LEFT_PARENTHESIS expr RIGHT_PARENTHESIS" << std::endl;
    }
|
NOT expr
    {
        std::cout << "expr -> NOT expr" << std::endl;
    }
|
expr AND expr
    {
        std::cout << "expr -> expr AND expr" << std::endl;
    }
|
expr OR expr
    {
        std::cout << "expr -> expr OR expr" << std::endl;
    }
|
expr LESS_THAN expr
    {
        std::cout << "expr -> expr LESS_THAN expr" << std::endl;
    }
|
expr GREATER_THAN expr
    {
        std::cout << "expr -> expr GREATER_THAN expr" << std::endl;
    }
|
ADD expr TO IDENTIFIER LINE_END
    {
        std::cout << "expr -> ADD expr TO IDENTIFIER LINE_END" << std::endl;
    }
|
SUBTRACT expr FROM IDENTIFIER LINE_END
    {
        std::cout << "expr -> SUBTRACT expr FROM IDENTIFIER LINE_END" << std::endl;
    }
|
MULTIPLY IDENTIFIER BY expr
    {
        std::cout << "expr -> MULTIPLY IDENTIFIER BY expr" << std::endl;
    }
|
DIVIDE IDENTIFIER BY expr
    {
        std::cout << "expr -> DIVIDE IDENTIFIER BY expr" << std::endl;
    }
|
MOD IDENTIFIER BY expr TO IDENTIFIER
    {
        std::cout << "expr -> MOD IDENTIFIER BY exor TO IDENTIFIER" << std::endl;
    }
;