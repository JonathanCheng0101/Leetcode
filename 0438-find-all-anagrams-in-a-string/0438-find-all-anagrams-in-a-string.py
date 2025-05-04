class Solution:
    def findAnagrams(self, s: str, p: str) -> List[int]:
        if len(p) > len(s):
            return []
        res = []

        checker = [0] * 26
        cur_window = [0] * 26
        a = ord('a')

        # check the first one
        for i in range(len(p)):
            checker[ord(p[i]) - a] += 1
            cur_window[ord(s[i]) - a] += 1

        if checker == cur_window:
            res.append(0)

        # check the rest 
        for i in range(len(p), len(s)):
            cur_window[ord(s[i-len(p)])- a] -= 1
            cur_window[ord(s[i]) - a] += 1
            if cur_window == checker:
                res.append(i - len(p) +1)

        return res