class Solution:
    def longestNiceSubstring(self, s: str) -> str:
        cur = ""
        res = ""
        for start in range(len(s)):
            for end in range(start + 1, len(s)+1):
                sub = s[start:end]
                valid = True

                for char in sub:
                    if char.swapcase() not in sub:
                        valid = False
                        break
                cur = sub
                if valid and len(cur) > len(res):
                    
                    res = cur
                    cur = ""

        return res



        
        