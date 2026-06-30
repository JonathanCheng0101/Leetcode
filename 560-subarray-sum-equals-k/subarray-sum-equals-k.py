
from collections import defaultdict 
class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        d = defaultdict(list) # prefix:[index]
        d[0].append(-1)

        res = 0
        prefix = 0

        for i, num in enumerate(nums):
            prefix += num
            need = prefix - k
            if need in d:
                res += len(d[need])

            d[prefix].append(i)
        
        return res