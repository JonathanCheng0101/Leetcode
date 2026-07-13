from collections import Counter
class Solution:
    def checkInclusion(self, s1: str, s2: str) -> bool:
        s1_cnt = Counter(s1)

        n = len(s1)

        window = Counter(s2[:n])
        if window == s1_cnt:
            return True
        l = 0
        for i in range(n, len(s2)):
            window[s2[i]] += 1
            window[s2[l]] -= 1
            
            if window[s2[l]] == 0:
                del window[s2[l]]
            l += 1
            if window == s1_cnt:
                return True
        
        return False


    
        
       