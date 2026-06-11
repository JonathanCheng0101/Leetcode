from heapq import heappop, heapify
class Solution:
    def numberGame(self, nums: List[int]) -> List[int]:
        res = []
        heapify(nums)

        while len(nums)> 1:
            a = heappop(nums)
            b = heappop(nums)

            res.append(b)
            res.append(a)

        return res


