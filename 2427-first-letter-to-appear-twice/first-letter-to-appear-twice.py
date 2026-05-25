class Solution:
    def repeatedCharacter(self, s: str) -> str:
        d = set()
        for char in s:
            if char not in d:
                d.add(char)
            else:
                return char