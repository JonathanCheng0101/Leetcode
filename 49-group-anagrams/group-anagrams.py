from collections import Counter, defaultdict

class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        res = defaultdict(list)
        for word in strs:
            cur = "".join(sorted(word))
            res[cur].append(word)
            print(cur)
        
        return(list(res.values()))


    
     