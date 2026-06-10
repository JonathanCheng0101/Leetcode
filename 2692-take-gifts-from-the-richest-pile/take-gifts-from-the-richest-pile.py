from heapq import heapify, heappop, heappush, heappushpop
from math import sqrt
class Solution:
    def pickGifts(self, gifts: List[int], k: int) -> int:
        heap = [-gift for gift in gifts]
        heapify(heap)

        while k > 0:
            a = -heappop(heap)
            heappush(heap, -floor(sqrt(a)))
            k -= 1

        return -sum(heap)
