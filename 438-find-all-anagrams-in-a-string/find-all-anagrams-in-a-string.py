from collections import Counter
class Solution:
    def findAnagrams(self, s: str, p: str) -> List[int]:
        res = []
        k= len(p)
        cnt_p = Counter(p)
        window = Counter(s[:k])
        if window == cnt_p:
                res.append(0)

        for right in range(k, len(s)):
            window[s[right]] += 1

            left = right - k
            window[s[left]] -= 1

            if window[s[left]] == 0:
                del window[s[left]]  

            if window == cnt_p:
                res.append(right - k + 1)

        return res


           