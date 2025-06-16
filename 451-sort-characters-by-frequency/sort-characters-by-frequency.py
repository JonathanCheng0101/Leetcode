from heapq import heapify, heappop, heappush 
from collections import defaultdict
class Solution:
    def frequencySort(self, s: str) -> str:
        wrd_dict = defaultdict(int)
        for char in s:
            wrd_dict[char] += 1

        sorted_lst = sorted(wrd_dict.items(), key=lambda x:x[1], reverse=True)
        output = ""
        for char, cnt in sorted_lst:
            output += char * cnt

        return output


        
