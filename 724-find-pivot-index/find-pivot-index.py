class Solution:
    def pivotIndex(self, nums: List[int]) -> int:
        d = {0: -1} # prefix: index

        prefix = 0
        lst_sum = sum(nums)

        for i, num in enumerate(nums):
            if prefix == (lst_sum - prefix - num):
                return i
            
            prefix += num
        
        return -1
            