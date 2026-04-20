class Solution:
    def reverseVowels(self, s: str) -> str:
        vowels = ['a','e','i','o','u','A','E','I','O','U']
        left, right = 0, len(s) - 1
        s = list(s)
        while left < right:
            if s[left] not in vowels:
                left += 1
            if s[right] not in vowels:
                right -= 1

            if s[left] in vowels and s[right] in vowels:
                s[left], s[right] = s[right], s[left]

                left += 1
                right -= 1

        return "".join(s)


