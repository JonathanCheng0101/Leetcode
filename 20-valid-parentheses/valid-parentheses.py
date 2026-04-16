class Solution:
    def isValid(self, s: str) -> bool:
        res = []
        hash_map = {')':'(',
                    '}':'{',
                    ']':'['}

        for ele in s:
            if len(res) == 0:
                res.append(ele)
            elif ele in hash_map and hash_map[ele] == res[-1] and len(res)>0:
                res.pop()
            else:
                res.append(ele)

        return len(res) == 0
        