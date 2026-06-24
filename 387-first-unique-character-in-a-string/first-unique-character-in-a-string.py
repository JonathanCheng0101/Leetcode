from collections import Counter
class Solution:
    def firstUniqChar(self, s: str) -> int:
        s_cnt = Counter(s)
        for i, char in enumerate(s):
            if s_cnt[char] == 1:
                return i

        return -1 
    