
--Q9

q9f1 :: t -> t
q9f1 x = x

q9f2 :: a -> b -> a
q9f2 a b = a

q9f3 :: (a->b->c) ->b -> a -> c
q9f3 f b a = f a b

q9f4 :: a -> b -> b
q9f4 a b = b

q9f5 :: (t1->t) -> t1 -> t
q9f5 f x = f x

q9f6 :: (t2->t1) -> (t1->t)->t2->t
q9f6 f g x = g (f x)

q9f7 :: Eq a => a -> a -> Bool
q9f7 a b = a == b

q9f8 :: Num a => t -> a
q9f8 x = 10

--q9f9 :: Eq a => (t->a) -> (t1->a) -> t -> t1 -> Bool
--q9f9 

--q9f10 :: (Eq a, Num a1, Num a2) => (a->a2->a1)->a->a->a1
--q9f10 

--q9f11 :: (t2->t1->t) -> (t2->t1) -> t2 -> t
--q9f11 f g x = x f g

q9f12 :: t -> t1
q9f12 x = error "z"
