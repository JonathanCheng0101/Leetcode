class Solution:
    def numSubarrayProductLessThanK(self, nums: List[int], k: int) -> int:
        res = 0

        l = 0
        cur = 1

        for r in range(len(nums)):
            
            cur = cur * nums[r]
            
            while cur >= k and l <= r:
                cur = cur/ nums[l]
                l += 1

            res += r - l + 1

        return res


            
            