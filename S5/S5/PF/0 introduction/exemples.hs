module Exemples where

quadruple n = double (double n)

double n = n + n

factorial n = product [2..n]

moyenne ns = sum ns `div` length ns
moyenne' ns = div (sum ns) (length ns)
