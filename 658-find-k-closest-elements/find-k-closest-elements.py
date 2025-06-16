from heapq import heapify, heappop
class Solution:
    def findClosestElements(self, arr: List[int], k: int, x: int) -> List[int]:
        res = []
        arr = [(abs(num - x), num) for num in arr]  # (interval, that number)
        heapify(arr)

        for _ in range(k):
            _, num = heappop(arr)
            res.append(num)

        return sorted(res, reverse=False)


        