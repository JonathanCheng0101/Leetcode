class Solution:
    def pivotIndex(self, nums: List[int]) -> int:
        total = sum(nums)
        prefix = 0
        d = {0: -1} # prefix: index
        for i, num in enumerate(nums):
            target = total - num - prefix
            if target == prefix:
                return i
            else:
                prefix += num
        
        return -1

            


        