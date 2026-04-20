class Solution:
    def reverseWords(self, s: str) -> str:
        s = s.strip()
        s_lst = s.split()
    

        new_s = s_lst[::-1]
        return " ".join(new_s)