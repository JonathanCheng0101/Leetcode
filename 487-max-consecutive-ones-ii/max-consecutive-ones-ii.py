from collections import Counter
class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        d = Counter()

        l = 0
        res = 0

        for r in range(len(nums)):
            d[nums[r]] += 1

            while d[0] > 1:
                d[nums[l]] -= 1
                l += 1
            
            res = max(res, sum(d.values()))
        
        return res