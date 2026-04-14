class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        res = {}
        for ele in s:
            res[ele] = res.get(ele, 0) + 1

        for ele in t:
            if ele in res:
                res[ele] -= 1
            else: 
                return False


        for ele in res:
            if res[ele] != 0:
                return False
        return True 