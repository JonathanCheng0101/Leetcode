class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        res = 0
        d = {0:1}
        prefix = 0
        for num in nums:
            prefix += num
            
            if (prefix - k) in d:
                res += d[prefix - k]
                
            d[prefix] = d.get(prefix, 0) + 1
            

        return res
            

