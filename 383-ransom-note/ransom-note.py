class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        res = {}
        if len(ransomNote) > len(magazine):
            return False
        

        else:
            for ele in magazine:
                res[ele] = res.get(ele, 0) + 1

            for ele in ransomNote:
                if ele in res:
                    res[ele] -= 1
                    
                    if res[ele] < 0:
                        return False
                else:
                    return False

            return True
            