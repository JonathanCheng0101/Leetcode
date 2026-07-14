from collections import Counter
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        s_cnt = Counter()
        l = 0
        res = 0

        for r, char in enumerate(s):
            if char in s_cnt:           
                while l <= r and char in s_cnt :
                    s_cnt[s[l]] -= 1
                    
                    if s_cnt[s[l]] == 0:
                        del s_cnt[s[l]]
                    
                    l += 1
            s_cnt[char] = 1
            
            
            res = max(res, r - l + 1)

        
        return res
            
