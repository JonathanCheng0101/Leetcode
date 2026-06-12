from collections import defaultdict, Counter
from heapq import heapify, heappush, heappop
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        nums = Counter(nums)
        heap = []
        for num, freq in nums.items():
            heappush(heap, (-freq,num))

        res = []
        while k > 0:
            res.append(heappop(heap)[1])

            k -= 1

        return res



        

        