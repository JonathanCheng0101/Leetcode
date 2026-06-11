from collections import defaultdict, Counter
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        res = []
        new_nums = Counter(nums).most_common(k)

        for ele, freq in new_nums:
            res.append(ele)

        return res

        