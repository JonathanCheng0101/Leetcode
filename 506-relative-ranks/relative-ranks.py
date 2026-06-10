from heapq import heappop, heappush, heapify
class Solution:
    def findRelativeRanks(self, score: List[int]) -> List[str]:
        d = {}
        res = []

        scores = score[:]
        heap = [- x for x in score]
        heapify(heap)
        
        for i in range(len(score)):
            a = -heappop(heap)
            if i == 0:
                d[a] = "Gold Medal"
            elif i == 1:
                d[a] = "Silver Medal"
            elif i == 2:
                d[a] = "Bronze Medal"

            else:
                d[a] = str(i+1)

        for ele in scores:
            res.append(d[ele])
        
        return res

        
                
