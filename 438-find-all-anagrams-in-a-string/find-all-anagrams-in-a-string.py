from collections import Counter
class Solution:
    def findAnagrams(self, s: str, p: str) -> List[int]:
        res = []
        n = len(p)
        l = 0

        window = Counter(s[:n])
        p_cnt = Counter(p)
        if window == p_cnt:
            res.append(0)

        for i in range(n, len(s)):
            if s[i] not in window:
                window[s[i]] = 1
            else:
                window[s[i]] += 1

            window[s[l]] -= 1
            if window[s[l]] == 0:
                del window[s[l]]
            l += 1

            if window == p_cnt:
                res.append(i - n + 1)
        
        return res
            

