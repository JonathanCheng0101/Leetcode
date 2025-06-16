from heapq import heappop, heapify
class Solution:
    def deleteGreatestValue(self, grid: List[List[int]]) -> int:
        res = 0

        for i in range(len(grid)):
            grid[i] = [-num for num in grid[i]]
            heapify(grid[i])

        while len(grid[0]) > 0:
            temp_lst = []
            
            for row in grid:
                temp_lst.append(-heappop(row))

            res += max(temp_lst)
            temp_lst = []

        
        return res

        