class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        d = {}
        l = 0
        res = 0

        for i, char in enumerate(s):
            while char in d:
                d[s[l]] -= 1

                if d[s[l]] == 0:
                    del d[s[l]]

                l += 1
            
            d[char] = 1
            res = max(res, i - l+ 1)
        
        return res


                          
        
        return 
