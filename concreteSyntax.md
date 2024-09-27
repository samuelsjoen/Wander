## Concrete syntax: grammar

```
Literal
    : IntegerLiteral
    | BooleanLiteral
    | StringLiteral
    | ArrayLiteral
;

IntegerLiteral : // we do not define it explicitly, but rather take it for granted for now
;

BooleanLiteral
    : 'true'
    | 'false'
;

StringLiteral : // we do not define it explicitly, but rather take it for granted for now
;

ArrayLiteral : '(' Literal ')' 
;

Statement
	: AssignmentStatement
	| IfStatement
	| WhileStatement
    | SwitchStatement
	| BlockStatement
    | ReturnStatement
;

AssignmentStatement :
    'var' Expression
;

IfStatement :
    'if' Expression '{'
        'then' Statement
    '}'
    'else' '{'
        Statement
    '}'
;

WhileStatement :
    'while' Expression '{'
        'then' LoopStatement
    '}'
;

SwitchStatement:
    'given' Expression '{'
        'ifIs' Expression '{'
            'do' Statement
        '}'
        'elseDo' '{'
            Statement
        '}'
    '}'
; 

BlockStatement:
    '{' 
        Statement 
    '}'
;

ReturnStatement:
    'return' Expression

LoopStatement
    : 'stop if' Expression
    | 'stop'
    | 'next' IntegerLiteral
    | Statement

Expression
    : Literal
    | StringLiteral
    | UnaryOp Expression
    | Expression BinaryOp Expression
    | FunctionName '[' Expression ']'
    | StringLiteral 'of' StringLiteral
    | StringLiteral 'at' IntegerLiteral
;

UnaryOp : '~'

BinaryOp : '+' | '-' | '*' | '|' | 'and' | 'or' | '==' | '>' | '<' | '>=' | '<='
;

Function : 
    'createFunction' StringLiteral '[' Parameter ']' '{'
        Statement
    '}'
;

Parameter
    : 'optional' StringLiteral
    | StringLiteral

ClassMember
    : 'field' StringLiteral
    | Function
    | 'static:' BooleanLiteral
    | 'getter' funct
    | 'setter' funct

Class :
    'createClass' StringLiteral 'extends' [StringLiteral] {'
        ClassMember
    '}'
```