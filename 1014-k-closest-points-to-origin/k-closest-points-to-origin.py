from heapq import heappop, heappush
class Solution:
    def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:
        res = []
        heap = []

        for point in points:
            heappush(heap, (point[0]**2 + point[1]**2, point))

        for _ in range(k):
            _, point = heappop(heap)
            res.append(point)

        return res
        
