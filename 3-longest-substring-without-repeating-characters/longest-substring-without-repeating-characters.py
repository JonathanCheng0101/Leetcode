from collections import Counter
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        window = {}
        l = 0
        res = 0

        for char in s:
            if char in window:
                while char in window:
                    window[s[l]] -= 1
                    
                    if window[s[l]] == 0:
                        del window[s[l]]
                    l += 1
            
            window[char] = 1
            res = max(res, len(window))
        
        return res


       