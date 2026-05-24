from collections import Counter
class Solution:
    def uniqueOccurrences(self, arr: List[int]) -> bool:
        res = set()
        num_cnt = Counter(arr)
        for ele, freq in num_cnt.items():
            if freq not in res:
                res.add(freq)
            else:
                return False
        return True

        