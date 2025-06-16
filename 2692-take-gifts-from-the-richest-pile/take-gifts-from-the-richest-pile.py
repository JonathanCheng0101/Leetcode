from heapq import heappop, heappush, heapify
class Solution:
    def pickGifts(self, gifts: List[int], k: int) -> int:
        gifts = [-gift for gift in gifts]

        heapify(gifts)

        for _ in range(k):
            num =  -heappop(gifts)
            new_num = math.sqrt(num)
            heappush(gifts, -math.floor(new_num))

        return -sum(gifts)