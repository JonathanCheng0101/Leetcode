class Solution:
    def reverseStr(self, s: str, k: int) -> str:
        def swap(s):
            return s[::-1]

        res = ""
        for i in range(0, len(s), 2*k):
            if i + 2 * k <= len(s):
                res += swap(s[i:i + k])
                res += s[i + k: i + 2* k]

            elif i + 2 * k >= len(s) and i +  k <= len(s):
                res += swap(s[i:i + k])
                res += s[i + k: len(s)]

            elif i +  k >= len(s):
                res += swap(s[i:len(s)])
            
        

        return res

            