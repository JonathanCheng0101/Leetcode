from collections import Counter
class Solution:
    def characterReplacement(self, s: str, k: int) -> int:
        d = Counter()
        res = 0
        l = 0
        

        for i in range(len(s)):
            d[s[i]] += 1
            most_freq = max(d.values())

            while most_freq + k < i - l + 1:
                d[s[l]] -= 1
                l += 1
                if d[s[l]] == 0:
                    del d[s[l]]

            res = max(res, i - l + 1)

        return res


        