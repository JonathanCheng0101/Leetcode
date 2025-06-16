from heapq import heapify, heappop
class Solution:
    def maxSubsequence(self, nums: List[int], k: int) -> List[int]:
        res = [None] *len(nums)
        nums = [(-num, i) for i,num in enumerate(nums)]
        heapify(nums)

        for _ in range(k):
            num, i = heappop(nums)
            res[i] = -num

        res = [ele for ele in res if ele is not None]

        return res



        