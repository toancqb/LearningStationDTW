from Graph import *

G = Graph(7)

G.add_edges([(1,0,5),(0,2,7),(0,3,4),(0,4,2),(1,4,2),(2,3,9),(3,4,3),(2,5,5)\
    ,(3,5,7),(3,6,4),(5,6,12),(4,6,7)])

G.print_Graph()