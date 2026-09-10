class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        seen = set(nums)
        res = 0

        for num in seen:
            if num - 1  in seen:
                continue
            
            length = 1
            while num + 1 in seen:
                length += 1
                num += 1
            
            res = max(res, length)
    
        return res
