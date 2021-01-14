
import P1

putStrln' str = do 
	putStr str
	putChar '\n'

putQStrLn' str = do
	putChar '\"'
	putStr str
	putChar '\"'
	putChar '\n'

main = do
	putStrln' "Hello"
	putQStrLn' "Hello"