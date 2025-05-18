class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        # empty s is always a subsequence
        if not s:
            return True
        # if s is longer than t it can't be
        if len(s) > len(t):
            return False

        i = 0
        for c in t:
            # first check that i is still in‐bounds, then compare
            if i < len(s) and s[i] == c:
                i += 1
                # early exit once we've matched all of s
                if i == len(s):
                    return True

        # if we've advanced i through all of s, it's a subsequence
        return i == len(s)
