class Solution:
    def checkSubarraySum(self, nums: List[int], k: int) -> bool:
        d = {0: -1} # remainder: index
        prefix = 0

        for i, num in enumerate(nums):
            prefix += num

            
            if prefix % k in d:
                if i - d[prefix % k] >= 2:
                    return True
            
            else:               
                d[prefix % k] = i
        
        return False
        