
import numpy as np

g = np.array([[0,1,1,0],
              [1,0,1,0],
              [1,1,0,0],
              [0,0,0,0]])

#Ecrire le code permettant de tester si il existe une arête entre le sommet 0 et le sommet 2. Entre le sommet 2 et le sommet 1.
print("g[0][2] =", g[0][2])
print("g[2][1] =", g[2][1])

#Ecrire une fonction voisins qui prend en entrée un graphe sous forme de matrice d'adjacence (qu'on supposera correcte) et un numéro sommet (qu'on supposera valide) et retourne la liste des sommets voisins (ou adjacents).

def voisins(graphe, sommet):
    lst_adj = []
    for index, e in enumerate(graphe[sommet]):
        if e == 1:
            lst_adj.append(index)
    #Test
    #print("Sommet", sommet, ":", lst_adj)
    return lst_adj

voisins(g,0)

#Order of a graph is the number of vertices in the graph.
#Size of a graph is the number of edges in the graph.
def taille(graphe):
    deg = 0
    for i in graphe:
        for j in i:
            deg += j
    return deg // 2

print(taille(g))

def creer(lst, n):
    g = [[0 for j in range(n)] for i in range(n)]
    for i in lst:
        g[i[0]][i[1]] = 1
        g[i[1]][i[0]] = 1

    return g

g2 = creer([(0,3),(1,2),(1,3)], 4)
print(g2)
print(taille(g2))

def ajouter_arete(graphe, sommet1, sommet2):
    graphe[sommet1][sommet2] = 1
    graphe[sommet2][sommet1] = 1

ajouter_arete(g2,2,3)
print(taille(g2))