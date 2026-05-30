class Solution:
    def backspaceCompare(self, s: str, t: str) -> bool:
        l, r = len(s) - 1, len(t) - 1
        l_cnt, r_cnt = 0, 0


        while l >= 0 or r >= 0:
            while l >= 0:
                if s[l] == "#":
                    l -= 1
                    l_cnt += 1
                elif l_cnt > 0:
                    l -= 1
                    l_cnt -= 1
                else:
                    break

            while r >= 0:
                if t[r] == "#":
                    r -= 1
                    r_cnt += 1
                elif r_cnt > 0:
                    r -= 1
                    r_cnt -= 1
                else:
                    break
        
            if l >= 0 and r >= 0:
                if s[l] != t[r]:
                    return False
            elif l >= 0 or r >= 0:
                return False
            l -= 1
            r -= 1
                      
        return True
            


