class Solution:
    def longestNiceSubstring(self, s: str) -> str:
        res = ""

        for start in range(len(s)):
            for end in range(start + 1, len(s) + 1):
                new_s = s[start:end]

                for char in new_s:
                    if char.swapcase() not in new_s:
                        legid = False
                        break
                    else:
                        legid = True

                if legid:
                    if len(new_s)>len(res):
                        res = new_s
        
        return res

