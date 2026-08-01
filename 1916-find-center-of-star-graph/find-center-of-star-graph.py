class Solution:
    def findCenter(self, edges: List[List[int]]) -> int:
        graph = [[] for _ in range(len(edges)+ 2)]

        for u, v in edges:
            graph[u].append(v)
            graph[v].append(u)
        
        for i, ele in enumerate(graph):
            if len(ele) == len(graph) - 2:
                return i
                
        