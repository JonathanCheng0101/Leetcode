from collections import Counter
from collections import defaultdict
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        d = defaultdict(list)
        for s in strs:
            s_cnt = Counter(s)
            key = "".join(sorted(s))
            if key not in d:
                d[key] = []
                
            d[key].append(s)

        return list(d.values())




     