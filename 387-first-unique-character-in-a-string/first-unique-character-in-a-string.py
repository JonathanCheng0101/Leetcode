from collections import Counter
class Solution:
    def firstUniqChar(self, s: str) -> int:
        s_cnt = Counter(s)
        
        for i,ele in enumerate(s):
            if s_cnt[ele] == 1:
                return i
        
        return -1
