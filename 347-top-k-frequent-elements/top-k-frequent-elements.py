from collections import Counter
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        res = []
        new_nums = Counter(nums)
        sort_nums = sorted(new_nums.items(), key = lambda x: -x[1])
        for i in range(k):
            res.append(sort_nums[i][0])

        return res
