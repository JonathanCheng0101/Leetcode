class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        if not s:
            return True
        # edge case s > t return false
        if len(s) > len(t):
            return False

        i = 0
        for c in t:
            if s[i] == c and i < len(s):
                i += 1

                if i == len(s):
                    return True
                  

        return i == len(s)


        

        