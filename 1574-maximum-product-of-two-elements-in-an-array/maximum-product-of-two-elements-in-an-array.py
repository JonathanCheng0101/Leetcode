from heapq import heapify, heappop
class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        nums = [-x for x in nums]
        heapify(nums)
        x =  - heappop(nums)
        y = - heappop(nums)

        return (x - 1) * (y - 1)

        