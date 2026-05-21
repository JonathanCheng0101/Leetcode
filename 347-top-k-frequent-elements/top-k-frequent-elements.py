from collections import Counter
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        res = []
        nums_cnt = Counter(nums)
        sorted_nums = sorted(nums_cnt.items(),key = lambda x:x[1], reverse= True)
        for i in range(k):
            res.append(sorted_nums[i][0])
        
        return res