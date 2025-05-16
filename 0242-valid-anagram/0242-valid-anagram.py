class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        chk_wrd=[0] * 26
        for char in s:
            chk_wrd[ord(char)-ord('a')] += 1

        for char in t:
            chk_wrd[ord(char)-ord('a')] -= 1

        for i in chk_wrd:
            if i != 0:
                return False
        return True
