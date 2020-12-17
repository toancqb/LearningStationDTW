module Definitions where

constante :: Integer
constante = 42

absolue :: Integer -> Integer
absolue n = if n < 0 then -n else n

signe :: Integer -> Integer
signe n = if n < 0
            then -1
            else if n == 0
                    then 0
                    else 1

pairSuivant :: Integer -> Integer
pairSuivant n = n + 1 + if n `mod` 2 == 0 then 1 else 0


-- Gardes

signe' :: Integer -> Integer
signe' n | n < 0     = -1
         | n == 0    = 0
         | otherwise = 1

signe'' :: Integer -> Integer
signe'' n | n < 0  = -1
          | n == 0 = 0
signe'' _          = 1


-- Filtrage de motifs

non :: Bool -> Bool
non True  = False
non False = True

(&&&) :: Bool -> Bool -> Bool
True  &&& True  = True
False &&& True  = False
True  &&& False = False
False &&& False = False

(&&&&) :: Bool -> Bool -> Bool
True &&&& True = True
_    &&&& _    = False

(&&&&&) :: Bool -> Bool -> Bool
b &&&&& True = b
_ &&&&& _    = False

(&&&&&&) :: Bool -> Bool -> Bool
b &&&&&& b' | b == b'   = b
            | otherwise = False

tete :: [a] -> a
tete (x:_xs) = x
tete []      = error "liste vide"

tete' :: [a] -> a
tete' xs = head xs
tete' [] = error "liste vide"

extraitTete :: [a] -> (a, [a])
extraitTete xs@(x:_) = (x, xs)
extraitTete []       = error "liste vide"

troisieme :: [a] -> a
troisieme (_:_:z:_) = z
troisieme [] = error "0 < 3"
troisieme [_] = error "1 < 3"
troisieme [_,_] = error "2 < 3"

teteImbriquee :: [[a]] -> a
teteImbriquee ((x:_):_) = x

eclair :: [a] -> [b] -> [(a,b)]
eclair []     _      = []
eclair _      []     = []
eclair (x:xs) (y:ys) = (x, y) : eclair xs ys
-- eclair [1,2] "abc"
-- (3e équation) = (1, 'a') : eclair [2] "bc"
-- (3e équation) = (1, 'a') : ( (2, 'b') : eclair [] "c" )
-- (1re équation) = (1, 'a') : ( (2, 'b') : ( [] ) )


-- Fonctions anonymes

-- \ ressemble un peu à la lettre λ
anon = \n -> 2 * n + 1

impairs :: [Integer]
impairs = map (\n -> 2 * n + 1) [0..]

impairs' :: [Integer]
impairs' = map f [0..]
    where f n = 2 * n + 1

impairs'' :: [Integer]
impairs'' = let f n = 2 * n + 1
            in  map f [0..]

mult :: Integer -> [Integer] -> [Integer]
mult n ns = map (\m -> m * n) ns


-- Sections

mult' :: Integer -> [Integer] -> [Integer]
mult' n ns = map ((*) n) ns

mult'' :: Integer -> [Integer] -> [Integer]
mult'' n ns = map (* n) ns

mult''' :: Integer -> [Integer] -> [Integer]
mult''' n ns = map (n *) ns

pow :: Integer -> [Integer] -> [Integer]
pow n ns = map (n ^) ns

pow' :: Integer -> [Integer] -> [Integer]
pow' n ns = map (^ n) ns
