
data Operateur = Mult | Div | Moins | Plus
                    deriving (Show)

data Expression = Valeur Float
                   | Operation Operateur Expression Expression
                   deriving (Show)

op2String :: Operateur -> String
op2String Mult = "*"
op2String Div = "/"
op2String Moins = "-"
op2String Plus = "+"

op2Function :: Operateur -> Float -> Float -> Float
op2Function Mult = (*)
op2Function Div = (/)
op2Function Moins = (-)
op2Function Plus = (+)

tree2String :: Expression -> String
tree2String (Valeur v) = show v
tree2String (Operation o g d) = "[" ++ (tree2String g)
                                ++ " " ++ (op2String o)
                                ++ " "  ++ (tree2String d) ++ "]"


data Expression op val = Constante val
                           | Operateur op
                             (Expression op val)
                             (Expression op val)

tree2String :: Expression -> String
tree2String (Constante v) = Show v
tree2String (operateur op expr1 expr2) =
          (tree2String expr1) ++ (Show op) ++ (tree2String expr2)

Q36:
ExpressionNP op val = Constante val
                      | Operateur op
                       (ExpressionNP)
                       (ExpressionNP)

Q38:
atSafe :: [a] -> b -> Maybe a
atSafe [] _ = Nothing
atSafe (x:xs) 0 = Just x
atSafe (_:xs) n = atSafe xs (n-1)

