
--E3
sommeDeXaY :: Int -> Int -> Int
sommeDeXaY x y = x + y

--E4
somme :: [Int] -> Int
somme [] = 0
somme (x:xs) = x + somme xs

--E5
last' :: [a] -> a
last' [] = error "Empty List"
last' a = head (reverse a)

init' :: [a] -> [a]
init' [] = error "Empty List"
init' a = take (length a - 1) a

--E6
-- Fonction !!
index' :: [a] -> Int -> a
index' [] n = error "Empty List"
index' xs n
   | n >= length xs = error "index too large"
index' xs n = head (drop n xs)

-- Fonction ++
joinListes :: [a] -> [a] -> [a]
joinListes [] ys = ys
joinListes (x:xs) ys = x : (joinListes xs ys)

-- Fonction map
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f xs = [f x | x <- xs]

-- Function concat
concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = joinListes x (concat' xs) 

--E8
lenList :: [a] -> Int
lenList [] = 0
lenList (x:xs) = 1 + (lenList xs)

--lenList' :: [a] -> Int
--lenList' [] = 0


--E9
fnx :: (a->a)->a->Int->a
fnx _ a 0 = a
fnx f x n = f (fnx f x (n-1))
  -- Recursive version: fnxList
fnxList :: (a->a)->a->Int->[a]
fnxList _ a 0 = [a]
fnxList f x n = (fnx f x n) : (fnxList f x (n-1))

fnxListRev :: (a->a)->a->Int->[a]
fnxListRev _ a 0 = [a]
fnxListRev f x n = reverse (fnxList f x n)

  -- Iterative version: en utilisant iterate et take
fxnListIterate :: (a->a)->a->Int->[a]
fxnListIterate _ a 0 = [a]
fxnListIterate f x n = take (n+1) (iterate f x)

--E10
createList :: Int->[Int]
createList n = fnxListRev (+1) 0 n
