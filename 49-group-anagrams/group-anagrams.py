from collections import Counter
from collections import defaultdict
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        d = defaultdict(list)

        for word in strs:
            s_cnt = Counter(word)

            key = str(sorted(word))
            print(key)
            if key in d:
                d[key].append(word)
            else:
                d[key].append(word)
            
        
        return [list(x) for x in d.values()]


     