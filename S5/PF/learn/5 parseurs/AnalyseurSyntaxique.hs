module AnalyseurSyntaxique where

import Prelude hiding (pure, (>>=), (>>))
import Data.Char (isLower, isDigit)

-- Functional pearl

-- Arbre de Syntaxe Abstraite (Abstract Syntax Tree, AST)

-- 1 + 2 + 3

-- (1 + 2) + 3
--     +
--     ├── +
--     │   ├── 1
--     │   └── 2
--     └── 3
--
-- 1 + (2 + 3)
--
--    +
--    ├── 1
--    └── +
--        ├── 2
--        └── 3

newtype Parser a = MkParser (String -> ResultatParser a)
type ResultatParser a = Maybe (a, String)

runParser :: Parser a -> String -> ResultatParser a
runParser (MkParser f) = f

--- Briques de base

unCaractereQuelconque :: Parser Char
unCaractereQuelconque = MkParser f
    where f ""     = Nothing
          f (c:cs) = Just (c, cs)

-- empty est l’analyseur syntaxique qui échoue toujours
empty :: Parser a
empty = MkParser f
    where f _ = Nothing

pure :: a -> Parser a
pure x = MkParser f
    where f entree = Just (x, entree)


--- Combinateurs

-- Alternative
(<|>) :: Parser a -> Parser a -> Parser a
p1 <|> p2 = MkParser go
    where go entree = case runParser p1 entree of
                        Nothing -> runParser p2 entree
                        r       -> r

-- Séquence
-- Parser a -> Parser b -> Parser (a, b)
-- (voir zip, zipWith)
-- (a -> b -> c) -> Parser a -> Parser b -> Parser c
(>>=) :: Parser a -> (a -> Parser b) -> Parser b
p >>= fp = MkParser go
    where go entree = case runParser p entree of
                        Nothing           -> Nothing
                        Just (x, entree') -> runParser (fp x) entree'

(>>) :: Parser a -> Parser b -> Parser b
-- p1 >> p2 = p1 >>= \_ -> p2
p1 >> p2 = p1 >>= const p2

--- Fin des combinateurs de base

ex :: String -> ResultatParser (Char, Char)
ex = runParser
        (unCaractereQuelconque >>= \c ->
            (unCaractereQuelconque >>= \c' ->
            pure (c, c')))

carQuand :: (Char -> Bool) -> Parser Char
carQuand cond = unCaractereQuelconque >>= filtre
    where filtre :: Char -> Parser Char
          filtre c | cond c    = pure c
                   | otherwise = empty

chiffre :: Parser Char
chiffre = carQuand isDigit

car :: Char -> Parser Char
car c = carQuand (c ==)

chaine :: String -> Parser String
chaine ""     = pure ""
chaine (c:cs) = car c     >>= \_ ->
                chaine cs >>= \_ ->
                pure (c:cs)

chaine' :: String -> Parser String
chaine' ""     = pure ""
chaine' (c:cs) = car c      >>
                 chaine' cs >>
                 pure (c:cs)

nombre :: Parser String
nombre = chiffre >>= \c ->
           ( nombre >>= \cs ->
             pure (c:cs) )
           <|> pure [c]

entier :: Parser Integer
-- entier = nombre >>= \n -> pure (read n)
entier = nombre >>= (pure . read)

some' :: Parser a -> Parser [a]
some' p = p >>= \c ->
           ( some' p >>= \cs ->
             pure (c:cs) )
           <|> pure [c]

some :: Parser a -> Parser [a]
some p = p      >>= \c ->
         many p >>= \cs ->
         pure (c:cs)

many :: Parser a -> Parser [a]
many p = some p <|> pure []

nombre' :: Parser String
nombre' = some chiffre


data AST = Entier Integer
         | Add    AST AST
    deriving (Show,Eq)

exprEntier :: Parser AST
exprEntier = some chiffre >>= (pure . Entier . read)

expression :: Parser AST
expression = exprEntier >>= \n ->
             ( car '+' >>
               expression >>= \e ->
               pure (Add n e) )
             <|> pure n
