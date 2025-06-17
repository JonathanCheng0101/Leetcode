from collections import defaultdict
from heapq import heappop, heappush, heapify

class Solution:
    def reorganizeString(self, s: str) -> str:
        wrd_dict = defaultdict(int)
        for char in s:
            wrd_dict[char] += 1

        max_heap = [(-num, wrd) for wrd, num in wrd_dict.items()]
        heapify(max_heap)

        res = []

        while len(max_heap) >= 2:
            freq1, wrd1 = heappop(max_heap)
            freq2, wrd2 = heappop(max_heap)

            res.append(wrd1)
            res.append(wrd2)
            freq1 += 1
            freq2 += 1

            if freq1:
                heappush(max_heap, (freq1, wrd1))
            if freq2:
                heappush(max_heap, (freq2, wrd2))

        if max_heap:  # one left
            freq, wrd = heappop(max_heap)
            if -freq > 1:
                return ""
            res.append(wrd)

        return "".join(res)
