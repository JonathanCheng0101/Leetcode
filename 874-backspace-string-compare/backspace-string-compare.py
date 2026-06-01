class Solution:
    def backspaceCompare(self, s: str, t: str) -> bool:
        l = len(s) - 1
        l_cur = 0
        l_res = []

        while l >= 0:
            if s[l] == "#":
                l_cur += 1
            elif s[l] != "#" and l_cur != 0:
                l_cur -= 1
            elif s[l] != "#" and l_cur == 0:
                l_res.append(s[l])

            l -= 1 

        r = len(t) - 1
        r_cur = 0
        r_res = []

        while r >= 0:
            if t[r] == "#":
                r_cur += 1
            elif t[r] != "#" and r_cur != 0:
                r_cur -= 1
            elif t[r] != "#" and r_cur == 0:
                r_res.append(t[r])

            r -= 1 

        return r_res == l_res

