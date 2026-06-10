from heapq import heapify, heappush, heappop
class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        heap = [-x for x in stones]

        heapify(heap)

        while len(heap) > 1:
            x = -heappop(heap)
            y = -heappop(heap)
            if x != y:
                heappush(heap, -abs(x - y))

        if len(heap) == 1:
            return -heap[0]
        return 0
