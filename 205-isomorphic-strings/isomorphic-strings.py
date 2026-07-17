class Solution:
    def isIsomorphic(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        
        d = {}
        d_t = {}
        
        n = len(s)
        for i in range(n):
            if s[i] not in d:
                d[s[i]] = t[i]
            
            else:
                if t[i] != d[s[i]]:
                    return False
            
            if t[i] not in d_t:
                d_t[t[i]] = s[i]
            
            else:
                if s[i] != d_t[t[i]]:
                    return False
        
        return True

        