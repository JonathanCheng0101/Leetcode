class Solution:
    def pivotIndex(self, nums: List[int]) -> int:
        d = {0: -1} # prefix: index
        sum_total = sum(nums)
        prefix = 0

        for i, num in enumerate(nums):
            back = sum_total - prefix - num 
            if back == prefix:
                return i
            
            prefix += num
            d[prefix] = i
        
        return -1


        