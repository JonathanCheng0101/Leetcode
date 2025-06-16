from heapq import heappop, heappush, heapify
class Solution:
    def findRelativeRanks(self, score: List[int]) -> List[str]:
        heap = []
        for i, ele in enumerate(score):
            heappush(heap, (-ele,i)) # index, ele

        res = [""] * len(score)
        rank = 1
        while heap:
            _, i = heappop(heap)
            
            if rank == 1:
                res[i] = "Gold Medal"
            elif rank ==2:
                res[i] = "Silver Medal"
            elif rank ==3:
                res[i] = "Bronze Medal"
            else:
                res[i] =str(rank)

            rank += 1

        return res



        
        