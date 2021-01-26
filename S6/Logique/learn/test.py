#! /usr/bin/python3

# Résolution par l'intermédiaire d'un solveur-SAT du problème de coloration
# avec 3 couleurs de la carte d'Australie.

# Pour utiliser ce code, il faut avoir installé pysat :
# pip install python-sat[pblib,aiger]

from pysat.solvers import Minisat22

# Données du problème

## Liste des états
etats = ["Western Autralia",
         "Nothern Territory",
         "Queensland",
         "South Australia",
         "New South Wales",
         "Victoria",
         "Tasmania"]

## Liste des couleurs
couleurs = ["rouge","vert","bleu"]

## Liste des paires de voisins
voisins =  [("Western Autralia","Nothern Territory"),
           ("Western Autralia","South Australia"),
           ("Nothern Territory", "Queensland"),
           ("Nothern Territory", "South Australia"),
           ("South Australia","Queensland"),
           ("Queensland", "New South Wales"),
           ("South Australia","New South Wales"),
           ("South Australia","Victoria"),
           ("New South Wales","Victoria"),
           ("Victoria","Tasmania")]

# Fonctions pour interagir avec la représentation des variables
# propositionnelles.

def encode(e,c):
    """Renvoie un nombre qui représente la variable propositionnelle pour paire
    (état,couleur). Ce nombre est unique et strictement positif pour chaque
    paire.
    """
    ne = len(etats)
    return 1 + etats.index(e) + ne * couleurs.index(c)

def decode(n):
    """Fonction inverse de décode. Étant donné un nombre n représentant une paire
(état,couleur), renvoie la paire."""
    m=n-1
    ne = len(etats)
    return (etats[m % ne], couleurs[m//ne])

# Nous représentons les contraintes du problème.

## Chaque état a au moins une couleur
phi1 = [[encode(e,c) for c in couleurs] for e in etats]
phi2 = [[-encode(e,c1),-encode(e,c2)] for e in etats
        for c1 in couleurs
        for c2 in couleurs
        if c1 != c2]
print(phi2)