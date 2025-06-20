from heapq import heappop, heapify, heappush

class Solution:
    def maxSum(self, grid: List[List[int]], limits: List[int], k: int) -> int:
        heap = []
        new_grid = [sorted(lst, reverse=True) for lst in grid]
        for i, num in enumerate(limits):
            for lil_num in new_grid[i][:num]:
                heappush(heap, lil_num)

        while k != len(heap):
            heappop(heap)

        return sum(heap)

        