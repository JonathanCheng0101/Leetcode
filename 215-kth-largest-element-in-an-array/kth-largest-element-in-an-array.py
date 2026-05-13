from heapq import heapify, heappop
class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        new_nums = [-n for n in nums]
        res = 0

        heapify(new_nums)

        while k > 0:
            res = heappop(new_nums)
            k -= 1
        
        return -res