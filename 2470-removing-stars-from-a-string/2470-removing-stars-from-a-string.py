class Solution:
    def removeStars(self, s: str) -> str:
        res = []

        for char in s:
            if char.isalpha():
                res.append(char)
            else:
                res.pop()

        return str("".join(res))
        