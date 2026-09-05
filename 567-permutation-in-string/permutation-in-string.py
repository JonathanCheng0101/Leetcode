from collections import Counter
class Solution:
    def checkInclusion(self, s1: str, s2: str) -> bool:
        s1_cnt = Counter(s1)

        length = len(s1)
        l = 0

        window = s2[:length]
        s2_cnt = Counter(window)
        if s2_cnt == s1_cnt:
            return True

        for i in range(length, len(s2)):
            s2_cnt[s2[i]] += 1

            s2_cnt[s2[l]] -= 1

            print(s2_cnt)

            if s2_cnt[s2[l]] == 0:
                del s2_cnt[s2[l]]
            
            l += 1

            if s2_cnt == s1_cnt:
                return True
            
        
        return False

     