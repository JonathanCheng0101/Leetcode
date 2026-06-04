class Solution:
    def countGoodSubstrings(self, s: str) -> int:
        if len(s)< 3:
            return 0

        res = 0
        
        cur = list(s[:3])
        if len(cur) == len(set(cur)):
                res += 1
        for i in range(3, len(s)):
            cur.append(s[i])
            cur.pop(0)
            if len(cur) == len(set(cur)):
                res += 1
        

        return res
        

        