
import networkx as nx
import matplotlib.pyplot as plt

# 
# G.number_of_nodes() •le nombre de sommets du graphe
# G.number_of_edges() •le nombre d’arêtes du graphe
# G.degree[1] •le degré du sommet 1
# G.degree[2] •le degré du sommet 2
# G.neighbors(1) or G.adj[1] •les voisins du sommet 1
#

def degre_max(g):
    assert isinstance(g, nx.classes.graph.Graph)
    dmax = 0
    for i in g.nodes:
        if dmax < g.degree[i]:
            dmax = g.degree[i]
    return dmax

def est_complet(g):
    assert isinstance(g, nx.classes.graph.Graph)
    n = g.number_of_nodes()
    e = g.number_of_edges()
    if e == n*(n-1)/2:
        return True
    return False

""" G = nx.Graph()
G.add_nodes_from([1,2,3,4])
G.add_edges_from([(1,4),(1,3),(1,2),(2,4),(2,3)])

plt.subplot(121)
nx.draw(G, with_labels=True, font_weight='bold')
plt.subplot(122)
nx.draw_shell(G, nlist=[range(5, 10), range(5)], with_labels=True, font_weight='bold')
plt.show() """

amis = nx.Graph()
amis.add_nodes_from([1,2,3,4,5,6,7])
amis.add_edges_from([(1,4),(2,4),(3,4),(2,3),(4,5),(4,6),(1,5),(5,7),(4,7)])

print("Deg max:",degre_max(amis))

plt.subplot(121)
nx.draw(amis, with_labels=True, font_weight='bold')
plt.subplot(122)
nx.draw_shell(amis, nlist=[range(5, 10), range(5)], with_labels=True, font_weight='bold')
plt.show() 