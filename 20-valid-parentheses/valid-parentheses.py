class Solution:
    def isValid(self, s: str) -> bool:
        res = []
        d = {')':'(',
            '}':'{',
            ']':'['}

        for char in s:
            if char not in d:
                res.append(char)
            
            else:
                if not res:
                    return False
                elif res[-1] == d[char]:
                    res.pop()
                elif res[-1] != d[char]:
                    return False

        return len(res) == 0
        