class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        seen = set(nums)
        res = 0
        cur = 0

        for num in seen:
            if num - 1 in seen:
                continue
            cur = num
            length = 1
            while cur + 1 in seen:
                cur += 1
                length +=1
            res = max(res, length)

        
        return res

