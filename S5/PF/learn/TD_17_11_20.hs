import Parser
import Data.Char (isDigit, isSpace)
-- Q47

-- entiers non signés :
chiffre :: Parser Char
chiffre = carQuand isDigit


entierNS :: Parser Int
entierNS = some (carQuand isDigit) >>= \n -> pure (read n)

entierNS' :: Parser Int
entierNS' = some chiffre >>= \n -> pure (read n)

--Main> runParser entierNS "1234abc12"
--Just (1234,"abc12")

signe :: Parser Char
signe = carQuand (== '+') <|> car '-'

-- chaine de chiffre
entierChaine :: Parser String
entierChaine = some chiffre

entierChaine' :: Parser String
entierChaine' = many chiffre

entierS :: Parser Int
entierS = signe >>= \s -> entierChaine >>= \n -> case s of
                                                 '+' -> pure (read n)
                                                 '-' -> pure (read (s:n))

entierS'' :: Parser Int
entierS'' = signe >>= \s -> 
         (entierNS >>= \n ->
          pure(f s n) )
   where f '+' n = n
         f '-' n = -n

entierS' :: Parser String
entierS' = signe >>= \s -> entierChaine' >>= \n -> case s of
                                                 '+' -> pure (n)
                                                 '-' -> pure (s:n)


--Main> runParser entierS' "-+"
--Just ("-","+")

entierSouNS :: Parser Int
entierSouNS = entierNS <|> entierS''

-- Q48
intOfChar :: Char -> Int
intOfChar c = read [c]

-- inspiration : sum, map, fold, entierChaine, entierChaine' ...

sommeChiffre :: Parser Int
sommeChiffre = entierChaine >>= \ch -> pure (sum (map intOfChar ch))

