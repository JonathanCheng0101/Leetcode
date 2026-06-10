from heapq import heappush, heappop, heapify
class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        heap = [-x for x in stones]
        heapify(heap)

        while len(heap)> 1:
            a = -heappop(heap)
            if len(heap)> 0:
                b = -heappop(heap)

                if a != b:  
                    heappush(heap, -abs(a - b))

        if heap:
            return -heap[0]
        else:
            return 0

