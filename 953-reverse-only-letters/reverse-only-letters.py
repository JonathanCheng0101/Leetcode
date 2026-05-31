class Solution:
    def reverseOnlyLetters(self, s: str) -> str:
        s_lst = list(s)
        l, r = 0, len(s) - 1
        while l < r:
            while l < r and not s_lst[l].isalpha():
                l += 1
            while l < r and not s_lst[r].isalpha():
                r -= 1

            s_lst[l], s_lst[r] = s_lst[r], s_lst[l]

            l += 1
            r -= 1

        return "".join(s_lst)