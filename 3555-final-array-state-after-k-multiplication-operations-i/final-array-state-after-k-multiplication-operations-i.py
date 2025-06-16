from heapq import heapify, heappop, heappush
class Solution:
    def getFinalState(self, nums: List[int], k: int, multiplier: int) -> List[int]:

        heap = [(ele, i) for i, ele in enumerate(nums)]
        heapify(heap)

        for _ in range(k):
            min_num, i = heappop(heap)
            min_num *= multiplier
            heappush(heap, (min_num, i))

        res = [0] *len(heap)
        while heap:
            new_num, i = heappop(heap)
            res[i] = new_num

        return res
        


        