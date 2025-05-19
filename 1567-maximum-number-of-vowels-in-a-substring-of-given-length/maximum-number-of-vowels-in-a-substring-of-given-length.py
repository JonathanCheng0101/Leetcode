class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        vowel_set = set({'a', 'e', 'i', 'o', 'u'})
        curr = res = l = 0

        for i in range(k):
            if s[i] in vowel_set:
                curr += 1
                res += 1

        for r in range(k, len(s)):
            if s[r] in vowel_set:
                curr += 1

            
            if s[l] in vowel_set:
                curr -= 1
            l += 1

            res = max(res, curr)


        return res        