from collections import Counter
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        res = []
        lst = Counter(nums).most_common(k)

        for ele, _ in lst:
            res.append(ele)

        return res

        