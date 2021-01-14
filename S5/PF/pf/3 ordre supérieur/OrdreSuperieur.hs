module OrdreSuperieur where

import Data.Char (isLower)
-- /usr/share/doc/ghc-doc/index.html

-- Fonctions d’ordre supérieur : fonctions qui prennent en argument
-- des fonctions et/ou retournent des fonctions
-- Parfois appelées « combinateurs »

-- Fonctions qui retournent une fonction : applications partielles

add :: Int -> Int -> Int
add n m = n + m

add' :: Int -> (Int -> Int)
add' n = \m -> n + m

ex1 :: Int -> Int
ex1 = add 1

ex2 :: Int
ex2 = ex1 2


-- Fonctions qui prennent en argument des fonctions

deuxFois :: (b -> b) -> b -> b
deuxFois f x = f (f x)

stupide :: [a] -> [a]
stupide = deuxFois reverse

map' :: (a -> b) -> [a] -> [b]
map' _ []     = []
map' f (x:xs) = f x : map' f xs

ex3 :: [Int] -> [Int]
ex3 = map (+ 1)

ex4 :: [Bool]
ex4 = map isLower "abcdGHI"

map'' :: (a -> b) -> [a] -> [b]
map'' f xs = [ f x | x <- xs ]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _    []                 = []
filter' cond (x:xs) | cond x    = x : filter' cond xs
                    | otherwise = filter' cond xs

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' cond xs = [ x | x <- xs, cond x ]

qsort :: Ord a => [a] -> [a]
qsort     [] = []
qsort (x:xs) = qsort ys ++ [x] ++ qsort zs
    where ys = [ y | y <- xs, y < x]
          zs = [ z | z <- xs, z >= x]

qsortGen :: (a -> a -> Bool) -> [a] -> [a]
qsortGen _        []  = []
qsortGen infst (x:xs) = qsortGen infst ys ++ [x] ++ qsortGen infst zs
    where ys = [ y | y <- xs, infst y x ]
          zs = [ z | z <- xs, not (infst z x) ]

qsort' :: Ord a => [a] -> [a]
qsort' = qsortGen (<)

-- Data.List : nombreuses fonctions ...By


--- Folds : foldr et foldl (parfois aussi appelé reduce)
-- Recombinaison des valeurs d’une structure de données
--
-- Voir https://www.joachim-breitner.de/blog/753-Drawing_foldl_and_foldr

sum' :: Num a => [a] -> a
sum' []     = 0
sum' (n:ns) = n + sum' ns

product' :: Num a => [a] -> a
product' []     = 1
product' (n:ns) = n * product' ns
-- product' (12 : (43 : []))
-- = 12 * product' (43 : [])
-- = 12 * (43 * product' [])
-- = 12 * (43 * (1))

and' :: [Bool] -> Bool
and' []     = True
and' (b:bs) = b && and' bs

-- La fonction suivante s’appelle foldr
generique _  v []     = v
generique op v (x:xs) = op x (generique op v xs)

sum'' :: Num t => [t] -> t
sum'' = generique (+) 0

product'' :: Num a => [a] -> a
product'' = generique (*) 1

and'' :: [Bool] -> Bool
and'' = generique (&&) True

sum''' = foldr (+) 0
product''' = foldr (*) 1
and''' = foldr (&&) True

-- Après expansion, l’expression calculée par sum :
-- sum [1,2,3]
-- sum (1 : (2 : (3 : [])))
--     (1 + (2 + (3 + 0)))

-- Dans le cas de l’addition, on pourrait aussi construire
-- l’expression dans l’autre sens :
--
--     (((0 + 1) + 2) + 3)
--
-- sum [1] -> (0 + 1)
-- sum (1 : 2 : []) -> ((0 + 1) + 2)

-- La fonction suivante s’appelle foldl
generiqueGauche _  v []     = v
generiqueGauche op v (x:xs) = generiqueGauche op (op v x) xs


-- Composition de fonctions
-- Cette fonction est : (.)

comp f g = \x -> f (g x)

even' :: Int -> Bool
even' = not . odd
--  <---  <---  <-- n

even'' :: Int -> Bool
even'' b = not (odd b)
