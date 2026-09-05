class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        l = 0
        cur = 0
        res = float('inf')

        for i, ele in enumerate(nums):
            cur += nums[i]

            while cur >= target:
                res = min(res, i - l + 1)
                cur -= nums[l]
                
                l += 1
                
        return 0 if res == float('inf') else res

            

        