class Solution:
    def maxSubArrayLen(self, nums: List[int], k: int) -> int:
        d = {0: -1} # prefix, index

        prefix = 0
        res = 0

        for i, num in enumerate(nums):
            prefix += num

            need = prefix - k
            if need in d:
                res = max(res, i - d[need]) 
            
            if prefix not in d:
                d[prefix] = i

        return res
