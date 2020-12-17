
doubleMe x = x * 2

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                       then x
                       else x*2

{-|
let lostNumbers = [4,8,15,16,23,42]
let he = ['h','e','h','e']
-}

concatList :: [Int]->[Int]->[Int]
concatList [] [] = []
concatList [x] [y] = [x] ++ [y]
