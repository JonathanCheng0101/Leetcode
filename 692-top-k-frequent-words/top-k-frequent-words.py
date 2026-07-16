from heapq import heappop, heapify, heappush
from collections import defaultdict
class Solution:
    def topKFrequent(self, words: List[str], k: int) -> List[str]:
        d = {}
        res = []
        for word in words:
            if word not in d:
                d[word] = 1
            else:
                d[word] += 1
        
        sorted_d = sorted(d.items(), key = lambda x:(-x[1], x[0]))[:k]
        
        for (k, v) in sorted_d:
            res.append(k)
        return res

            

            
        