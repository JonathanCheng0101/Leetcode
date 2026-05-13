from collections import Counter
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        res = []
        nums_dict = Counter(nums)
        sorted_item = sorted(nums_dict.items(), key = lambda x:x[1], reverse= True)
        for (num,v) in sorted_item:
            if k > 0:
                res.append(num)
                k -= 1

        return res
            