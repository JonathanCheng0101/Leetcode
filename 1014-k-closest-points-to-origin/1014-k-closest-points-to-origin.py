from heapq import heappop, heappush
class Solution:
    def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:

        heap = []

        for point in points:
            heappush(heap, (point[0]**2 + point[1]**2, point))

        res = []

        for _ in range(k):
            _, pt = heappop(heap)

            res.append(pt)

        return res

        
        