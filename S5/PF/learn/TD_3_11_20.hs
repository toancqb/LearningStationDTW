--Q33

-- C'est un type d'arbre comme vu en TP paramétré par le type de l'opérateur (opérateur = attribut des noeuds internes -- de l'arbre) et les le type des valeurs des feuilles. les feuilles ont pour constructeur Constante, et les noeuds internes -- Operateur. Arbre =>type récursif, il y a deux sous arbres c'est à dire deux Expression fille pour chaque noeud
-- interne : les opérateurs sont ici des opérateurs binaires et ont donc besoins de deux arguments.
-- Nouveau type avec une nouvelle structure => déclaration avec data et pas avec type qui serait un synonime de type.

data Expression op val = Constante val | Operateur op (Expression op val) (Expression op val) deriving Show

--Q35

-- filtrage sur la structure d'une Expression qui peut être soit construite avec Constante, soit avec Operateur

tree2String :: Show op => Expression op Float -> String
tree2String (Constante v) = show v
tree2String (Operateur oper exp1 exp2) = "("++(tree2String exp1)++(show oper)++(tree2String exp2)++")"

--Q36

-- si on définit le type des opérateurs suivant :

data TypeOperateur = MULT | DIV | PLUS | MOINS deriving Show

-- il faut une fonction qui permette d'associer l'opération réalisée aux éléments du type (encore du filtrage sur les constructeurs du type)  :

evalOp :: Num a => TypeOperateur -> (a->a->a)
evalOp MULT    = (*)
-- evalOp DIV       = (/) pas Num a !!!
evalOp PLUS     = (+)
evalOp MOINS  = (-)

eval :: Expression TypeOperateur Float -> Float
eval (Constante x) = x
eval (Operateur oper exp1 exp2) = (evalOp oper) (eval exp1) (eval exp2)

-- Pour faire plus général :
eval' :: (op->val->val->val) -> (a->val) -> Expression op a -> val
eval' _ g (Constante x) =  g x
eval' f g (Operateur oper exp1 exp2) = (f oper) (eval' f g exp1) (eval' f g exp2)

evalBis :: Expression TypeOperateur Float -> Float
evalBis = eval' evalOp id

foldExp :: (op->a->a->a) -> (val->a) -> Expression op val -> a
foldExp f g (Constante x) = g x
foldExp f g (Operateur oper exp1 exp2) = (f oper) (foldExp f g exp1) (foldExp f g exp2)

evalExpFloat :: Expression TypeOperateur Float -> Float
evalExpFloat = foldExp evalOp id

-- On pourrait l'appliquer avec d'autres type, par exemple avec un autre type d'operateur :
data TypeOpString = Elem1 | Elem2 | Elem3 deriving Show

evalString :: TypeOpString -> String -> String -> String
evalString Elem1 ch1 ch2 = "("++ch1++"|"++ch2++")"
evalString Elem2 ch1 ch2 = "("++ch1++"."++ch2++")"
evalString Elem3 ch1 ch2 = "("++ch1++"."++ch2++")*"


evalExpString :: Expression TypeOpString Int -> String
evalExpString = foldExp evalString show

-- on peut aussi refaire tree2String pour les Expression TypeOperateur Float
evalOpString :: TypeOperateur -> (String->String->String)
evalOpString MULT    = mult
             where mult x y = "("++x++"*"++y++")"
evalOpString PLUS     = plus
             where plus x y = "("++x++"+"++y++")"
evalOpString MOINS  = moins
             where moins x y = "("++x++"-"++y++")"

tree2String' :: Expression TypeOperateur Float -> String
tree2String' = foldExp evalOpString show

e1 = Constante 12
e2 = Constante 34
e3 = Constante 56
e4 = Constante 78
e5 = Constante 90
e6 = Constante 28
e7 = Operateur PLUS e1 e2
e8 = Operateur MULT e3 e4
e9 = Operateur PLUS e7 e8
e10 = Operateur MOINS e9 e5
expr = Operateur MULT e6 e10

chaine1 = tree2String expr
chaine2 = tree2String' expr
val1 = evalBis expr
val2 = evalExpFloat expr

e1' = Constante 12
e2' = Constante 34
e3' = Constante 56
e4' = Constante 78
e5' = Constante 90
e6' = Constante 28
e7' = Operateur Elem1 e1' e2'
e8' = Operateur Elem2 e3' e4'
e9' = Operateur Elem3 e7' e8'
e10' = Operateur Elem1 e9' e5'
expr' = Operateur Elem2 e6' e10'

chaine3 = evalExpString expr'

-- Q36

data ExpressionNP op val = Vide | Const val (ExpressionNP op val) | Operate op (ExpressionNP op val) deriving Show

-- Q37
parse :: ExpressionNP op val -> Expression op val
parse = fst.parse' where
      parse' Vide = error "ExpressionNP mal formée" 
      --parse' (Const x Vide) = (Constante x, Vide)
      parse' (Const x e) = (Constante x, e)
      parse' (Operate oper e) = (Operateur oper e1 e2, ess) where
             (e1,es) = parse' e
             (e2,ess) = parse' es
-- * (+ (+ 2 3) (+ 4 5)) 6

-------------------------
enp1 = Const 1 Vide
enp2 = Const 2 enp1
enp3 = Operate PLUS enp2
enp4 = Const 3 enp2
enp5 = Const 4 enp4
enp6 = Operate MULT enp5
enp7 = Operate MOINS enp6
enp8 = Operate PLUS enp7
enp9 = Operate PLUS enp8

    
-- Q38

atSafe :: [a] -> Int -> Maybe a 
atSafe [] _ = Nothing
atSafe (x:_) 0 = Just x
atSafe (_:xs) n = atSafe xs (n-1)

-- Q39

tailSafe :: [a] -> Maybe [a]
tailSafe [] = Nothing
tailSafe (_:xs) = Just xs

-- Q40

minimumSafe :: Ord a => [a] -> Maybe a
minimumSafe [] = Nothing
minimumSafe [x] = Just x
minimumSafe (x:y:xs) = minimumSafe ((min x y):xs)
-- récursive terminale : le calcul se fait par les paramètres vers
-- le cas de base : le cas de base retourne le résultat


minimumSafe' :: Ord a => [a] -> Maybe a
minimumSafe' [] = Nothing
minimumSafe' (x:xs) = case minimumSafe' xs of
                           Nothing -> Just x
                           Just y -> Just (min x y)
-- récursive non terminale : le calcul se fait en remontant les résultats du
-- cas de base vers le premier appel : le cas de base ne connait pas encore le
-- résultat

-- Q41
foldr1' :: (a->a->a)->[a]->a
foldr1' _ [] = error "liste vide"
foldr1' _ [x] = x
foldr1' f (x:xs) = x `f` foldr1' f xs

-- Q42
foldrSafe :: (a->a->a)->[a]-> Maybe a
foldrSafe _ [] = Nothing
foldrSafe f xs = Just (foldr1' f xs)

foldrSafe' :: (a->a->a)->[a]->Maybe a
foldrSafe' _ [] = Nothing
foldrSafe' f (x:xs) = case foldrSafe' f xs of
                           Nothing -> Just x
                           Just y -> Just (x `f` y)

foldr1Safe''' :: (a -> a -> a) -> [a] -> Maybe a
foldr1Safe''' _ [] = Nothing
foldr1Safe''' _ [x] = Just x -- indispensable pour que le fromJust ne donne pas
-- d'erreur : on s'assure que le foldr1Saffe''' ne donnera pas Nothing.
foldr1Safe''' f (x:xs) = Just (x `f` fromJust (foldr1Safe''' f xs))

-- Q43
minimumSafe'' :: Ord a => [a] -> Maybe a
minimumSafe'' = foldrSafe' min

-------------

complet n e = fst (aux n e)
        where aux 0 e = (Feuille,e)
              aux n e = (Noeud c v g d, ess)
                  where (g, (c,v):es) = aux (n-1) e
                        (d, ess) = aux (n-1) es





n = 3, e = [(4),(2),(5),(1),(6),(3),(7)]

(g, (v):es) = aux 2 [(4),(2),(5),(1),(6),(3),(7)]
              (g, (v):es) = aux 1 [(4),(2),(5),(1),(6),(3),(7)]
                              (g , (v):es) = aux 0 [(4),(2),(5),(1),(6),(3),(7)]
                              (Feuille,[(4),(2),(5),(1),(6),(3),(7)])
                              (d, ess) = aux 0 [(4),(2),(5),(1),(6),(3),(7)]
                              (Feuille,[(4),(2),(5),(1),(6),(3),(7)])
                          ((Noeud 4 Feuille Feuille), [(2),(5),(1),(6),(3),(7)])
              (d, ess) = aux 1 [(2),(5),(1),(6),(3),(7)]
                             (g, v:es) = (Feuille, [(2),(5),(1),(6),(3),(7)])
                             (d, ess) = (Feuille, [(2),(5),(1),(6),(3),(7)])
                          ((Noeud 2 Feuille Feuille), [(5),(1),(6),(3),(7)])
           = (Noeud 5 (Noeud 4 Feuille Feuille) (Noeud 2 Feuille Feuille), [(1),(6),(3),(7)] )
(d,ess) = aux 2 [(1),(6),(3),(7)]
          (Noeud 3 (Noeud 1 Feuille Feuille) (Noeud 6 Feuille Feuille), [(7)])
(Noeud 7 (Noeud 5 (Noeud 4 Feuille Feuille) (Noeud 2 Feuille Feuille)) (Noeud 3 (Noeud 1 Feuille Feuille) (Noeud 6 Feuille Feuille))
