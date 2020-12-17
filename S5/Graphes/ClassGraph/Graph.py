class Graph():
    
    def __init__(self,n):
        self.number_of_nodes = n
        self.nodes = [i for i in range(n)]
        self.G = [[0 for i in range(n)] for i in range(n)]
        self.edges = []

    def add_edge(self, u, v, weigh):
        self.G[u][v] = weigh
        self.G[v][u] = weigh
        self.edges.append((u,v,weigh))
    
    def add_edges(self, lst):
        for i in lst:
            self.G[i[0]][i[1]] = i[2]
            self.G[i[1]][i[0]] = i[2]
            self.edges.append((i[0],i[1],i[2]))
    
    def is_edge(self, u, v):
        return self.G[u][v] != 0

    def is_node(self, n):
        return (0 <= n and n < self.number_of_nodes)
    
    def print_Graph(self):
        print("    ",end="")
        for i in self.nodes:
            print("",i,"", end="")

        print("")
        n = 0
        for i in self.G:
            print("",n," ",end="")
            print(i)
            n += 1

    def deg(self, n):
        if self.is_node(n):
            count = 0
            for i in self.G[n]:
                if i > 0:
                    count += 1
            return count
        return -1

    def neighbors(self, n):
        if not self.is_node(n):
            return None
        lst = []
        for i in range(self.number_of_nodes):
            if i != n and self.G[n][i] > 0:
                lst.append(i)
        return lst
    
    def weigh_of_edge(self, u, v):
        return self.G[u][v]



        
        
        