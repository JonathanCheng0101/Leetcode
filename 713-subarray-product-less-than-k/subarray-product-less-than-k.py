class Solution:
    def numSubarrayProductLessThanK(self, nums: List[int], k: int) -> int:
        cur = 1
        res = 0
        r = 0

        for i in range(0, len(nums)):
            cur = cur * nums[i]
            while r <= i and cur >= k:
                cur  = cur/ nums[r]
                r += 1
                
            res += i - r + 1

        return res

