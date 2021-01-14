module EntreesSorties where

import Data.Char (toUpper, isDigit)
import Control.Applicative (empty, many)

putStr' :: String -> ()
putStr' = undefined

id' :: a -> a
id' x = let _ = putStr "message"
        in  x

-- (>>=) :: IO a -> (a -> IO b) -> IO b

echo :: IO ()
echo = getChar >>= \c -> putChar (toUpper c)

doubleEcho :: IO ()
doubleEcho = getChar >>= \c ->
             ( putChar c >>= \() ->
               putChar c )

doubleEcho' :: IO ()
doubleEcho' = getChar >>= \c ->
              ( putChar c >>
                putChar c )

doubleEcho'' :: IO ()
doubleEcho'' = do
    c <- getChar
    putChar c
    putChar c

get2Chars :: IO (Char, Char)
get2Chars = getChar >>= \c1 ->
            getChar >>= \c2 ->
            pure (c1, c2)

get2Chars' :: IO (Char, Char)
get2Chars' = do
    c1 <- getChar
    c2 <- getChar
    pure (c1, c2)

afficheChaine :: String -> IO ()
afficheChaine ""     = pure ()
afficheChaine (c:cs) = putChar c >> afficheChaine cs

afficheChaine' :: String -> IO ()
afficheChaine' ""     = pure ()
afficheChaine' (c:cs) = do
    putChar c
    afficheChaine' cs

-- mapM :: (a -> IO b) -> [a] -> IO [b]
-- mapM_ :: (a -> IO b) -> [a] -> IO ()

afficheChaine'' :: String -> IO ()
afficheChaine'' = mapM_ putChar

getCharWhen :: (Char -> Bool) -> IO Char
getCharWhen cond = getChar >>= filtre
    where filtre :: Char -> IO Char
          filtre c | cond c    = pure c
                   | otherwise = empty

getLigne :: IO String
getLigne = many (getCharWhen ('\n' /=))

interagit :: (String -> String) -> IO ()
interagit f = do
    entree <- many getChar
    putStr (f entree)

main :: IO ()
main = interagit reverse

-- (>>=) :: IO a -> (a -> IO b) -> IO b
-- (>>=) :: Parser a -> (a -> Parser b) -> Parser b
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b

