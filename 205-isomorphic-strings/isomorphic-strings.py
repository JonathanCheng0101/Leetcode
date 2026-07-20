class Solution:
    def isIsomorphic(self, s: str, t: str) -> bool:
        s_d = {}

        for index, char in enumerate(s):
            if char not in s_d:
                s_d[char] = t[index]
            else:
                if s_d[char] != t[index]:
                    return False

        s_t = {}

        for index, char in enumerate(t):
            if char not in s_t:
                s_t[char] = s[index]
            else:
                if s_t[char] != s[index]:
                    return False
    
        return True
        

