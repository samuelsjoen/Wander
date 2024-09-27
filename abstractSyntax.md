## Abstract syntax in Zephyr ASDL

```
Program = { statements: [Statement] }

Literal
    = Int
    | Boolean
    | String
    | Array

Statement
	= AssignmentStatement
	| IfStatement
	| WhileStatement
    | SwitchStatement
	| BlockStatement
    | ReturnStatement

AssignmentStatement = { variable: string, value: Expression }

IfStatement = { condition: Expression, trueBranch: Statement, falseBranch: Statement }

WhileStatement =  { condition: Expression, body: LoopState }

SwitchStatement = { expression: Expression, cases: [(Literal, Expression)], defaultCase: Expression }

BlockStatement = { stmts: [Statement] }

ReturnStatement = { Expression }

LoopStatement:
    = StopIf { condition: Expression, trueBranch: Stop }
    | Stop 
    | Next { value: int }
    | RegStatement { Statement }


Expression
    = Literal
    | VariableReference { name: string }
    | UnaryExpression { op: UOp, right: Expression }
    | BinaryExpression { left: Expression, op: BOp, right: Expression }
    | FunctCall { functionName: string, arguments: [Expression] }
    | ClassMemberAccess { instanceName: String, memberName: String}
    | ArrayIndexing {name: string, index: int}

UOp:
    = Negate

BOp:
    = Add
    | Sub
    | Mul
    | Div
    | And
    | Or
    | Eq
    | Bigger
    | Lesser
    | BiggerOrEq
    | LesserOrEq


Funct = { name: string, parameters: [String], body: Statement }

ClassMember
    = Field { name: string }
    | Method { method: Funct }
    | ReadOnly { bool }
    | WriteOnly { bool }
    | getter { Funct }
    | setter { Funct }

Class = { name: string, extends: [string], members: [ClassMember] }
```