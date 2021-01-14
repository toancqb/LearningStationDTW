
doubleMe x = x + x

t01 x = if x > 100
    then x
    else x * 2

max'' :: Int -> Int -> Int
max'' x y = if x > y then x else y


max' :: [Int] -> Int
max' [] = 0
max' [x] = x
max' (x:xs) = max'' x (max' xs)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

bmiTell :: (RealFloat a) => a -> String
bmiTell bmi | bmi <= 18.5 = "Underweight"
            | bmi <= 25.0 = "Normal"
            | bmi <= 30.0 = "Fat"
            | otherwise = "Whale"

bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' w h
            | bmi <= 18.5 = "Underweight"
            | bmi <= 25.0 = "Normal"
            | bmi <= 30.0 = "Fat"
            | otherwise = "Whale"
            where bmi = w / h^2

myCompare :: (Ord a) => a -> a -> Ordering
myCompare a b | a > b = GT
              | a == b = EQ
              | otherwise = LT

initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname  
          (l:_) = lastname

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' 0 _ = []
replicate' n a = a : replicate' (n-1) a