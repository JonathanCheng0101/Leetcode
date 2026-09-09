class Solution:
    def isIsomorphic(self, s: str, t: str) -> bool:
        d_s = {}
        d_t = {}
        for char_s, char_t in zip(s, t):
            if char_s not in d_s:
                d_s[char_s] = char_t
            else:
                if d_s[char_s] != char_t:
                    return False

        for char_s, char_t in zip(s, t):
            if char_t not in d_t:
                d_t[char_t] = char_s
            else:
                if d_t[char_t] != char_s:
                    return False
        
        return True
        
        
