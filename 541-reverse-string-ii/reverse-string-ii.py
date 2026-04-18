class Solution:
    def reverseStr(self, s: str, k: int) -> str:
        res = []
        temp = []
        word = list(s)
        for i, char in enumerate(word):
            if i % (2 * k) < k:
                temp.append(char)
            else:
                if temp:
                    new_temp = temp[::-1]
                    for i in new_temp:
                        res.append(i)
                    temp = []
                
                res.append(char)
        if temp:
            res.extend(temp[::-1])

        ans = "".join(res)
        return ans
            