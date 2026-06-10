from heapq import heapify, heappush, heappop
class Solution:
    def kWeakestRows(self, mat: List[List[int]], k: int) -> List[int]:
        nums = [sum(x) for x in mat]
        res = []
        for i, ele in enumerate(nums):
            res.append((ele, i))

        final = []
        heapify(res)

        while k > 0:
            final.append(heappop(res)[1])
            k -= 1

        return final
        
        
    