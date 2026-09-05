from collections import Counter
class Solution:
    def totalFruit(self, fruits: List[int]) -> int:
        d = {}
        l = 0
        cur = 0

        for i, ele in enumerate(fruits):
            if ele not in d:
                d[ele] = 1          
            else:
                d[ele] += 1
            
            if len(d) > 2:
                while len(d) > 2:
                    d[fruits[l]] -= 1
                    if d[fruits[l]] == 0:
                        del d[fruits[l]]
                    l += 1
            
            cur = max(cur, sum(d.values()))
        
        return cur
    