module Language where

data Literal
    = IntegerLiteral Int
    | BooleanLiteral Bool
    | StringLiteral String
    | ArrayLiteral [Literal]
    deriving (Show)

    
data Statement
    = AssignmentStatement String Expression
    | IfStatement Expression Statement Statement
    | WhileStatement Expression LoopStatement
    | SwitchStatement Expression [(Literal, Expression)] Expression
    | BlockStatement [Statement]
    | ReturnStatement Expression
    deriving (Show)

data LoopStatement
    = StopIf Expression
    | Stop
    | Next Int
    | RegStatement Statement
    deriving (Show)

data Expression
    = Lit Literal
    | VariableReference String
    | UnaryExpression UOp Expression
    | BinaryExpression BOp Expression Expression
    | FunctCall String [Expression]
    | ClassMemberAccess String String
    | ArrayIndexing String Int
    deriving (Show)

data UOp
    = Negate
    deriving (Show)

data BOp
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
    deriving (Show)

data Funct
    = Funct String [Param] Statement
    deriving (Show)

data Param
    = OptionalParam String
    | RegularParam String
    deriving (Show)

data ClassMember
    = Field String
    | Method Funct
    | ReadOnly Bool
    | WriteOnly Bool
    | Getter Funct
    | Setter Funct
    deriving (Show)

data Class
    = Class String [String] [ClassMember]
    deriving (Show)