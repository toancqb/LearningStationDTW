module Types where

add :: (Int, Int) -> Int
add (n, m) = n + m

zeroTo :: Int -> [Int]
zeroTo n = [0..n]

duplique :: Int -> (Int, Int)
duplique n = (n, n)


-- Fonctions polymorphes

-- b est une variable de type
-- duplique' a le type b -> (b,b) pour tout b
duplique' :: b -> (b, b)
duplique' x = (x, x)

identite :: a -> a
identite x = x

-- Philip Wadler « Theorems for free »
-- [a] -> a

ex1 :: [a] -> a
ex1 = head

-- [a] -> [a]

ex2 :: [a] -> [a]
ex2 = tail

ex3 :: [a] -> [a]
ex3 = reverse

ex4 :: [a] -> [a]
ex4 = id


-- Fonctions curryfiées

add' :: Int -> (Int -> Int)
add' n m = n + m

ex5 :: Int
ex5 = (add' 12) 34

ex6 :: Int -> Int
-- ex6 est une _application partielle_ de add'
ex6 = add' 12


-- Surcharge
--
-- => : contraintes de classes de types
-- Num p : signifie que p doit être un type qui est dans la classe Num

ex7 :: Int
ex7 = 12

ex8 :: Float
ex8 = 1.3
