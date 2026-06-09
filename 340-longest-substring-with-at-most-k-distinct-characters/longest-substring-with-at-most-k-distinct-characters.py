from collections import Counter
class Solution:
    def lengthOfLongestSubstringKDistinct(self, s: str, k: int) -> int:
        d = Counter()
        l = 0
        res = 0

        for r in range(len(s)):
            d[s[r]] += 1

            while l <= r and len(d)> k:
                d[s[l]] -= 1
                
                if d[s[l]] == 0:
                    del d[s[l]]
                l += 1

            res = max(res, sum(d.values()))


        return res
        