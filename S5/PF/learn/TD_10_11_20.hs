-- On commence la section 5 :

-- Q44

--Parser a : un seul constructeur qui construit une fonction qui prend une chaine et retourne Resultat a
-- le type Resultat a = type Maybe, contient un élément de type a = type du "vrai' résultat et un élément de
-- type String qui est le reste de l'entrée qui n'a pas été parsé.
-- Exemple unCaractereQuelconque :: Parser Char : consomme un seul caractère de l'entrée (-> type a = Char) et-- laisse le reste de l'entrée dans la partie "String" du resultat.

--parse :: ExpressionNP op val -> Expression op val
--parse = fst.parse' where
--      parse' Vide = error "ExpressionNP mal formée" 
--      --parse' (Const x Vide) = (Constante x, Vide)
--      parse' (Const x e) = (Constante x, e)
--      parse' (Operate oper e) = (Operateur oper e1 e2, ess) where
--             (e1,es) = parse' e
--             (e2,ess) = parse' es
-- * (+ (+ 2 3) (+ 4 5)) 6

-- | Exécute un analyseur syntaxique sur une entrée donnée comme une
-- chaîne
-- runParser :: Parser a -> String -> Resultat a
-- runParser (MkParser f) = f

-- Q45

runParser empty "haskell"
-- Nothing

runParser (pure 5) "haskell"
-- Just(5,"haskell")
-- pure 5 :: Parser Int

runParser unCaractereQuelconque "haskell"
-- Just ('h', "askell")

runParser (empty <|> pure 5) "haskell"
-- empty echoue -> Nothing, donc le résultat de (empty <|> pure 5) = résultat de (pure 5)
-- Just(5,"haskell")

runParser (pure 5 <|> empty) "haskell"
-- Just(5,"haskell")

runParser (empty >>= \_ -> pure 5) "haskell"
-- Nothing

runParser (pure 5 >>= \_ -> empty) "haskell"
-- Nothing

runParser (pure 6 >>= \c -> pure c) "haskell"
-- Just (6, "haskell")

runParser (pure "12" >>= \c -> pure (read c :: Int)) "haskell"
-- Just (12,"haskell")

runParser (unCaractereQuelconque >>= \c ->
           unCaractereQuelconque >>= \c' ->
           pure [c',c]) "haskell"
-- Just ("ah","skell")

runParser (unCaractereQuelconque >>= \c -> unCaractereQuelconque >>= \c' -> pure [read [c']:: Int,read [c] :: Int]) "12345"
-- Just ([2,1],"345")