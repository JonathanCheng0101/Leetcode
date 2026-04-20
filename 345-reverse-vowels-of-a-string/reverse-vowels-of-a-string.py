class Solution:
    def reverseVowels(self, s: str) -> str:
        vowels = ['a','e','i','o','u','A','E','I','O','U']
        res = []
        temp = []

        for ele in s:
            if ele in vowels:
                temp.append(ele)

        temp = temp[::-1]
        cnt = 0
        for ele in s:
            if ele in vowels:
                res.append(temp[cnt])
                cnt += 1
            else:
                res.append(ele)

        return "".join(res)
