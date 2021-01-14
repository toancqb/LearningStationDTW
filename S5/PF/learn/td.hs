
-- Q1
sommeDeXaY :: (Num a) => a -> a -> a
sommeDeXaY a b = a + b

-- Q2
sommeList :: (Num a) => [a] -> a
sommeList [] = 0
sommeList (x:xs) = x + (sommeList xs)

-- Q3
produitList :: (Num a) => [a] -> a
produitList [] = 1
produitList (x:xs) = x * produitList xs

-- Q4
-- [Char] 
-- [(Bool, Char)]
-- ([Bool], [Char])
-- ([Char], Char)
-- [[a]->[a]]
-- [a] -> [a] -- take 5
-- (Char, Char, Char)
-- [(Bool,Bool),(Char,Char)]
-- ([a]->[a],[a]->[a],[a]->[a])

-- Q5
second :: [a] -> a
second xs = head (tail xs)

swap :: (a,b) -> (b, a)
swap (x, y) = (y, x)

pair :: a -> b -> (a, b)
pair x y = (x, y)

fst' :: (a, b) -> a
fst' (x, _) = x

double :: (Num a) => a -> a
double x = x*2

palindrome :: (Eq a) => [a] -> Bool
palindrome xs = xs == reverse xs

twice :: (a -> a) -> a -> a
twice f x = f (f x)

-- Q6 
curryfie :: ((t1,t2) -> t) -> t1 -> t2 -> t
curryfie f x y = f (x, y)

-- Q7
decurryfie :: (t1 -> t2 -> t) -> (t1, t2) -> t
decurryfie g (x, y) = g x y

-- Q8
itere :: (t->t) -> Int -> t -> t
itere _ 0 x = x
itere f n x = itere f (n-1) (f x)

-- Q9
id' :: t -> t
id' x = x

v2 :: a->b->a
v2 x y = x

v3 :: (a->b->c) -> b -> a -> c
v3 f x y = f y x

v4 :: a -> b -> b
v4 x y = y

v5 :: (t1 -> t) -> t1 -> t
v5 f x = f x

v6 :: (t2->t1) -> (t1->t) -> t2 -> t
v6 f g x = g (f x)

v7 :: (Eq a) => a -> a -> Bool
v7 x y = x == y

v8 :: (Num a) => t -> a
v8 _ = error("z")

v9 :: (Eq a) => (t->a) -> (t1->a) -> t -> t1 -> Bool
v9 f g x y = f x == g y

v10 :: (Eq a, Num a1, Num a2) => (a->a2->a1) -> a -> a -> a1
v10 f x y = f x 10

v11 :: (t2->t1->t) -> (t2->t1) -> t2 -> t
v11 f g x = f x (g x)

v12 :: t -> t1
v12 _ = error("z")

-- Q10
v1' :: (Num a) => a->a->a
v1' x y = x + y

v2' :: (Num a, Num a1) => (a1 -> a) -> a
v2' f = f 10

v3' :: (Num a) => a -> (a-> a)
v3' x = add
       where add x = x

-- Q12
last' :: [a] -> a
last' xs = head (reverse xs)

init' :: [a] -> [a]
init' xs = reverse (drop 1 (reverse xs))

-- Q13
index' :: [a] -> Int -> a
index' [] _ = error("index too large")
index' (x:xs) 0 = x
index' (x:xs) n = index' xs (n-1)

plusplus :: [a]->[a]->[a]
plusplus [] ys = ys
plusplus xs ys =  plusplus (init' xs) ((last' xs) : ys)

double' :: (Num a) => a -> a
double' x = 2*x

map' :: (a->a)->[a]->[a]
map' _ [] = []
map' f (x:xs) = (f x) : map' f xs

concat' :: [[a]] -> [a]
concat' [[]] = []
concat' [x] = x
concat' (x : xs) = x `plusplus` (concat' xs)

-- Q14
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = (myReverse xs) `plusplus` [x]

-- Q15
myButLast :: [a] -> a
myButLast xs = head (drop 1 (myReverse xs))

-- Q16
compress' :: (Eq a) => [a] -> [a]
compress' [] = []
compress' [x] = [x]
compress' (x:y:zs) = if x == y then compress' (y:zs)
                               else x : compress' (y:zs)

-- Q19
fac :: Integer -> Integer
fac 0 = 1
fac n = n * (fac (n-1))                            

somFac :: Integer -> Integer
somFac 0 = 0
somFac n = fac (n `mod` 10) + somFac (n `div` 10)

-- Q20
calcFac :: [Integer] -> [Integer]
calcFac xs = [x | x <- xs, x == (somFac x)]

-- Q21
vol :: Integer -> [Integer]
vol n = n : vol (somFac n)

data TupleEntiers = Paire Int Int | Triplet Int Int Int
                          deriving Show

reduit :: TupleEntiers -> Int
reduit (Paire m n) = m + n
reduit (Triplet a b c) = a + b +c                        