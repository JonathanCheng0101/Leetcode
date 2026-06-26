class Solution:
    def maxSubArrayLen(self, nums: List[int], k: int) -> int:
        d = {0:-1} #  prfix_sum, index

        prefix = 0
        length = 0

        for i, num in enumerate(nums):
            prefix += num
            need = prefix - k
            if need in d:
                length = max(length, i - d[need])
            if prefix not in d:
                d[prefix] = i
        
        return length

        