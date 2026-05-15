from collections import Counter
class Solution:
    def mostFrequentEven(self, nums: List[int]) -> int:
        res = []
        new_nums = Counter(nums)
        for k,v in new_nums.items():
            if k % 2 == 0:
                res.append((k,v))
        
        if len(res) == 0:
            return -1
        else:
            new_res = sorted(res, key = lambda x:(-x[1],x[0]))
            return new_res[0][0]



            