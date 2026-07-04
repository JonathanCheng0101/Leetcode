from collections import Counter
class Solution:
    def checkInclusion(self, s1: str, s2: str) -> bool:
        s1_cnt = Counter(s1)
        n = len(s1)
        l = 0

        window = Counter(s2[:n])

        if s1_cnt == window:
            return True
        
        for i in range(n, len(s2)):
            if s2[i] not in window:
                window[s2[i]] = 1
            else:
                window[s2[i]] += 1
            
            window[s2[l]] -= 1
            if window[s2[l]] == 0:
                del window[s2[l]]
            l += 1

            if window == s1_cnt:
                return True

        return False
            


        