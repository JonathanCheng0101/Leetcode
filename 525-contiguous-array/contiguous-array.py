class Solution:
    def findMaxLength(self, nums: List[int]) -> int:
        res = 0
        prefix = 0 # +1 - 1 
        d = {0:-1} # prefix: index

        for i, num in enumerate(nums):
            if num == 1:
                prefix += 1
            else:
                prefix -= 1

            need = prefix
            if need in d:
                res = max(res, i- d[need])

            if prefix not in d:
                d[prefix] = i

        
        return res
    
            

        