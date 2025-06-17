from heapq import heappop, heapify
class Solution:
    def kWeakestRows(self, mat: List[List[int]], k: int) -> List[int]:
        lst = []
        for i, row in enumerate(mat):
            lst.append((sum(row),i))

        heapify(lst)
        res = []
        for i in range(k):
            _, i = heappop(lst)
            res.append(i)


        return res
        
        