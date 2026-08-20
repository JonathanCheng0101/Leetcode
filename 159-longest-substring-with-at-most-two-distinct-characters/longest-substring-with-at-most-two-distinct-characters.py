from collections import Counter
class Solution:
    def lengthOfLongestSubstringTwoDistinct(self, s: str) -> int:
        d = {}
        l = 0
        res = 0

        for i, char in enumerate(s):
            if char not in d:
                while len(d) >= 2:
                    d[s[l]] -= 1

                    if d[s[l]] == 0:
                        del d[s[l]]
                    
                    l += 1
                
                d[char] = 1

            else:
                d[char] += 1
            
            res = max(res, sum(d.values()))

        
        return res


    