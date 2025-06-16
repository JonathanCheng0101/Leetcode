from heapq import heappush, heappop, heapify
class Solution:
    def numberGame(self, nums: List[int]) -> List[int]:
        res = []

        heapify(nums)
        while nums:
            alice = heappop(nums)
            bob = heappop(nums)

            res.append(bob)
            res.append(alice)

        return res