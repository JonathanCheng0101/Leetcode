from heapq import heapify, heappop, heappush
class Solution:
    def longestDiverseString(self, a: int, b: int, c: int) -> str:
        res = ""
        heap = []
        if a > 0:
            heap.append((-a, "a"))
        if b > 0:
            heap.append((-b, "b"))
        if c > 0:
            heap.append((-c, "c"))
        heapify(heap)

        while heap:
            freq1, output1 = heappop(heap)

            if len(res) >= 2 and (res[-2] == res[-1] == output1):
                if not heap:
                    break
                freq2, output2 = heappop(heap)
                freq2 += 1
                res += output2
                if freq2 < 0:
                    heappush(heap, (freq2, output2))
                heappush(heap, (freq1, output1))

            else:
                freq1 += 1
                res += output1
                if freq1 < 0:
                    heappush(heap, (freq1, output1))

        return res
##關鍵，一次只要想一個字母，不要想著加兩個，因為情況會太複雜
            
            

        