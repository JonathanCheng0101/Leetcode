from collections import Counter
class Solution:
    def countKConstraintSubstrings(self, s: str, k: int) -> int:
        d = Counter()

        cnt = 0
        l = 0


        for r in range(len(s)):
            d[s[r]] += 1
            

            while d["0"]> k and d["1"]> k:
                d[s[l]] -= 1

                l += 1

            cnt += r-l+1

        return cnt

        