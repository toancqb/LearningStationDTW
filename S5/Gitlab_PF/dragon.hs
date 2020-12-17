module Main where

import Graphics.Gloss

--Exercice 5
pointAintercaler :: Point -> Point -> Point
--pointAintercaler () () = ()
pointAintercaler p1 p2 = ((fst p1 + fst p2) / 2 + (snd p2 - snd p1) / 2 , (snd p1 + snd p2)/2 + (fst p1 - fst p2)/2)

-- Exercice 6
pasDragon :: Path -> Path
pasDragon [] = []
pasDragon [p] = [p]
--pasDragon (a:b:ps) = a : (pointAintercaler a b) : pasDragon (b:ps)
pasDragon (a:b:ps)
           | length (a:b:ps) `mod` 2 == 0  = a : (pointAintercaler a b) : pasDragon(b:ps)
           | otherwise = a : (pointAintercaler b a) : pasDragon (b:ps)

--Exercice 7
dragon :: Point -> Point -> [Path]
dragon p1 p2 = iterate pasDragon [p1,p2]

--Exercice 8
dragonOrdre :: Point -> Point -> Int -> Path
dragonOrdre p1 p2 0 = [p1,p2]
dragonOrdre p1 p2 n = pasDragon (dragonOrdre p1 p2 (n-1))

--dragon' :: Point -> Point -> Int -> [Path]
--dragon' p1 p2 0 = [p1,p2]
--dragon' p1 p2 n = 

main = animate (InWindow "MyDragon" (500,500) (0,0)) white (dragonAnime (50,250) (450,250))

dragonAnime a b = Line (dragon' a b 0)
--dragonAnime a b t = Line (dragon a b !! (round t `mod` 20))


