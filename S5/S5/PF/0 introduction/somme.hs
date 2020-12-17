module Somme where

somme n = sum [1..n]
-- [..] est une notation pour la fonction enumFromTo
somme' n = sum (enumFromTo 1 n)

sommePairs n = sum [2,4..n]
-- [, ..] est une notation pour la fonction enumFromThenTo
sommePairs' n = sum (enumFromThenTo 2 4 n)

sommeCarres n = sum (map (^2) [1..n])
