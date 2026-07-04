from collections import Counter
class Solution:
    def findAnagrams(self, s: str, p: str) -> List[int]:
        res = []
        p_cnt = Counter(p)
        n = len(p)
        l = 0

        window = Counter(s[:n])

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
                res.append(l)

        return res

            

                
        
        