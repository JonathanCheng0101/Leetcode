class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        vowels = ['a', 'e','i','o','u']
        strings = list(s)
        cur = strings[:k]   # cur = current字
        res = 0

        for ele in cur:
            if ele in vowels:
                res += 1    # res = current vowels數量
        total = res
        
        for i in range(k, len(s)):
            cur += strings[i]
            if strings[i] in vowels:
                res += 1

            cur = strings[i-k+ 1: i]
            if strings[i - k] in vowels:
                res -= 1

            total = max(total, res)

        return total
            

