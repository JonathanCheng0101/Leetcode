from collections import Counter
class Solution:
    def characterReplacement(self, s: str, k: int) -> int:
        res = 0
        l = 0
        d = Counter()

        for r in range(len(s)):
            d[s[r]] += 1

            most_freq = max(d.values()) # 次數
            while most_freq + k < r - l +1:
                d[s[l]] -= 1
                l += 1



            res = max(res, r - l + 1)

        return res



        