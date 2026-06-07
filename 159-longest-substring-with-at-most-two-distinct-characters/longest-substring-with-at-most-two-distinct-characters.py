from collections import Counter
class Solution:
    def lengthOfLongestSubstringTwoDistinct(self, s: str) -> int:
        d = Counter()
        res = 0
        l = 0

        for r in range(len(s)):
            d[s[r]] += 1

            while len(d) > 2:
                d[s[l]] -= 1

                if d[s[l]] == 0:
                    del d[s[l]]
                l += 1


            res = max(res, r - l + 1)

        return res
        