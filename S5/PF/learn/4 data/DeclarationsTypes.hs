module DeclarationsTypes where

-- Synonymes de types

type String' = [Char]

type Point = (Float, Float)

bouge :: Point -> Point
bouge (x, y) = (x+1, y)

ex1 :: (Float, Float)
ex1 = (1, 2)

ex2 :: (Float, Float)
ex2 = bouge ex1

type Paire a = (a, a)

ex3 :: Paire Float
ex3 = ex2

duplique :: a -> Paire a
duplique x = (x, x)

type Rayon = Float
type Cercle = (Point, Rayon)

-- type Arbre a = (Arbre a, a, Arbre a)


-- Types de données algébriques

data Bool' = Vrai | Faux
    deriving Show

show' :: Bool' -> String
show' Vrai = "Vrai"
show' Faux = "Faux"

data Reponse = Oui | Non | PtetBenQuOuiPtetBenQuNon
    deriving Show

contredit :: Reponse -> Reponse
contredit Oui                      = Non
contredit Non                      = Oui
contredit PtetBenQuOuiPtetBenQuNon = PtetBenQuOuiPtetBenQuNon

data TupleEntiers = Paire   Int Int
                  | Triplet Int Int Int
    deriving Show

reduit :: TupleEntiers -> Int
reduit (Paire n m)     = n + m
reduit (Triplet n m o) = n + m + o

data PeutEtre a = Rien
                | Juste a
    deriving (Eq, Show)

-- (===) :: PeutEtre a -> PeutEtre a -> Bool

tete :: [a] -> PeutEtre a
tete []    = Rien
tete (x:_) = Juste x

commenceParA :: String -> Bool
commenceParA cs = head cs == 'A'

commenceParA' :: String -> Bool
commenceParA' cs = tete cs == Juste 'A'

commenceParA'' :: String -> Bool
commenceParA'' cs = case tete cs of
                        Juste 'A' -> True
                        _         -> False

data Liste a = Vide
             | Cons a (Liste a)
    deriving (Eq, Show)

convert :: [a] -> Liste a
convert []     = Vide
convert (x:xs) = Cons x (convert xs)

-- foldr (+) 0 [1,2,3]
-- foldr (+) 0 (1 : (2 : (3 : [])))
--           = (1 + (2 + (3 +  0)))
-- foldr Cons Vide (1 : (2 : (3 : [])))
--               = (Cons 1 (Cons 2 (Cons 3 Vide)))
--
convert' :: [a] -> Liste a
convert' = foldr Cons Vide

trevnoc :: Liste a -> [a]
trevnoc Vide = []
trevnoc (Cons x xs) = x : trevnoc xs


data Arbre a = Noeud a [Arbre a]
    deriving Show

ex4 :: Arbre Int
ex4 = Noeud 1 []

ex5 :: Arbre Int
ex5 = Noeud 2 [ex4, ex4, ex4]

ex6 :: Arbre Int
ex6 = Noeud 3 [ex5, ex6]

mapArbre :: (a -> b) -> Arbre a -> Arbre b
mapArbre f (Noeud x as) = Noeud (f x) (map (mapArbre f) as)
