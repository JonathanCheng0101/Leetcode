class Solution:
    def firstUniqChar(self, s: str) -> int:
        res = {}
        for ele in s:
            res[ele] = res.get(ele, 0) + 1 
        for i, ele in enumerate(s):
            if res[ele] == 1:
                return i
        return -1
                   