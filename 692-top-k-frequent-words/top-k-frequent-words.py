from heapq import heappop, heapify, heappush
from collections import defaultdict
class Solution:
    def topKFrequent(self, words: List[str], k: int) -> List[str]:
        res = []
        word_dict = defaultdict(int)

        for word in words:
            word_dict[word] += 1

        lst = sorted(word_dict.items(), key=lambda x:(-x[1],x[0]))
        for i in range(k):
            res.append(lst[i][0])
            

        return res
            
        