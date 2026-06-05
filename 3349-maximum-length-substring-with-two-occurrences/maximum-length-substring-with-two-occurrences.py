class Solution:
    def maximumLengthSubstring(self, s: str) -> int:
        d = {}
        res = 0
        l = 0

        for i in range(len(s)):
            if s[i] not in d:
                d[s[i]] = 1

            else:                  
                if d[s[i]] == 2:
                    while d[s[i]] == 2:
                        d[s[l]] -= 1
                        l += 1
                d[s[i]] += 1  

            res = max(res, i-l + 1)

        return res


        