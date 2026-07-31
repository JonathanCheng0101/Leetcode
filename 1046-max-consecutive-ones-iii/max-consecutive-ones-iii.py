class Solution:
    def longestOnes(self, nums: List[int], k: int) -> int:
        res = 0
        l = 0

        for i in range(len(nums)):
            if nums[i] == 0:
                if k > 0:
                    k -= 1
                else:
                    while k == 0:
                        if nums[l] == 0:
                            k += 1

                        l += 1
                    k -= 1
            
            res = max(res, i - l + 1)
        
        return res