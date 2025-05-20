class Solution:
    def reverseWords(self, s: str) -> str:
        res = []
        curr = ""

        for char in s:
            if not char.isalpha() and not char.isalnum():
                if len(curr) == 0:
                    continue
                else:
                    res.append(curr)
                    curr = ""

            else:
                curr += char

        if curr:
            res.append(curr)
            
        # return " ".join(res[:: -1])
        result = ""
        for i in range(len(res)-1, -1, -1):
            result += res[i]
            result += " "

        return result[:-1]

            