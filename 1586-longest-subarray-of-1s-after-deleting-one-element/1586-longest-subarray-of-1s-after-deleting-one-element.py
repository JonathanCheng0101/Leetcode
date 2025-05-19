class Solution:
    def longestSubarray(self, nums: List[int]) -> int:
        # edge case
       
        if sum(nums) == len(nums):  
            return (len(nums) - 1)
        
        k = 1
        l = res = curr = 0

        for r in range(len(nums)):
            if nums[r] != 1:
                k -= 1

            while k < 0:
                if nums[l] != 1:
                    k += 1

                l += 1

            curr = r - l
            res = max(res, curr)

        return res