class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        s_lst = s.strip().split(' ')
        return len(s_lst[-1])
