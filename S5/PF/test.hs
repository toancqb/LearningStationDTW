
somme n = sum [1..n]

tete (x:_) = x
tete [] = error "Empty list"

reste (_:xs) = xs

length1 [] = 0
length1 (_:xs) = 1 + length xs

length2 s = case s of
   []   -> 0
   _:xs -> 1 + length2 xs

sommeDeXaY x y = x + y

somme_list [Int]->Int
somme_list [] = 0
somme_list [x:xs] = x + somme_list [xs]
