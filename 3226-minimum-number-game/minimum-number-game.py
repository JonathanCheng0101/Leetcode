from heapq import heappush, heappop, heapify
class Solution:
    def numberGame(self, nums: List[int]) -> List[int]:
        res = []
        heapify(nums)
        while len(nums)> 0:
            a = heappop(nums)
            
            if len(nums)> 0:
                b = heappop(nums)
            res.append(b)   
            res.append(a)
            


        return res