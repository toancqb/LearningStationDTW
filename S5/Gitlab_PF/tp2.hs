
--Exercice 1
alterne' :: [a]->[a]
alterne' [x] = [x]
alterne' [x,_] = [x]
alterne' (x:(y:xs)) = x : alterne' xs
--

--Exercice 2
combine' :: (a->b->c)->[a]->[b]->[c]
combine' _ [] _ = []
combine' _ _ [] = []
combine' f (x:xs) (y:ys) = f x y : combine' f xs ys

--Exercice 3 zipWith
pasPascal :: [Integer]->[Integer]
pasPascal [] = []
pasPascal xs = zipWith (+) (xs++[0]) (0:xs)

--Exercice 4
pascal :: [[Integer]]
pascal = iterate pasPascal [1]
