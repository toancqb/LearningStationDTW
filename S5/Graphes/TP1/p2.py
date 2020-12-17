g = [[1,2],[0,2],[0,1],[]]

#Ecrire le code permettant de tester si il existe une arête
# entre le sommet 0 et le sommet 2. 
# Entre le sommet 2 et le sommet 1.

for i in g[0]:
    if i == 2:
        print("Il existe une arete 0 et 2")

for i in g[2]:
    if i == 1:
        print("Il existe une arete 2 et 1")

def taille(graphe):
    deg = 0
    for i in g:
        deg += len(i)
    return deg // 2

print(taille(g))

def creer(lst, n):
    g = [[] for i in range(n)]
    for i in lst:
        g[i[0]].append(i[1])
        g[i[1]].append(i[0])
    return g

g2 = creer([(0,3), (1, 2), (1, 3)],4)
print(taille(g2))

def ajouter_arete(graphe, sommet1, sommet2):
    graphe[sommet1].append(sommet2)
    graphe[sommet2].append(sommet1)