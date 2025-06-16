from heapq import heappop, heappush, heapify
class Solution:
    def fillCups(self, amount: List[int]) -> int:
        if not any(amount):
            return 0
        cnt = 0
        heap = [-num for num in amount if num > 0]
        heapify(heap)

        while heap:
            first = -heappop(heap)
            first -= 1

            second = 0
            if heap:
                second = -heappop(heap)
                second -= 1

            if first > 0:
                heappush(heap, -first)
            if second > 0:
                heappush(heap, -second)
            cnt += 1
        
        return cnt


        