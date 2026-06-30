class Solution:
    def pivotIndex(self, nums: List[int]) -> int:
        lst_sum = sum(nums)
        prefix = 0

        for i, num in enumerate(nums):
            
            if prefix == (lst_sum -num - prefix):
                return i 
            
            prefix += num

        return -1
