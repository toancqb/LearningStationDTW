-- Functions that have type variables are called Polymorphic function
--
--
doubleMe x = x * 2

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                       then x
                       else x*2

concatList :: [Int]->[Int]->[Int]
concatList [] [] = []
concatList x y = x ++ y

sumList :: [Int]->Int
sumList [] = 0
sumList x = head x + sumList (tail x)

length' xs = sum [1 | _ <- xs] 

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

-- Catch-all pattern
addVector :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVector (x1,y1) (x2,y2) = (x1 + y1, x2 + y2)

-- If u want to bind to several vars, we have to surround them in parentheses
headd :: [a] -> a
headd [] = error "Empty List!"
headd (x:_) = x

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
     | bmi <= 18.5 = "Underweight"
     | bmi <= 25.0 = "Normal"
     | bmi <= 30.0 = "Fat"
     | otherwise = "Whale"
     where bmi = weight / height ^ 2

max' :: (Ord a) => [a] -> a
max' [] = error "Empty List"
max' [x] = x
max' (x:xs)
  | x > maxtail = x
  | otherwise = maxtail
  where maxtail = max' xs

max1 :: (Ord a) => [a] -> a
max1 [] = error "Empty List"
max1 [x] = x
max1 (x:xs) = max x (max1 xs)






