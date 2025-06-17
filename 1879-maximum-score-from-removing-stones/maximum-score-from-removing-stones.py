from heapq import heapify, heappop, heappush
class Solution:
    def maximumScore(self, a: int, b: int, c: int) -> int:
        lst = [-a, -b, -c]
        res = 0
        heapify(lst)

        
        while len(lst) > 1:

            num1 = -heappop(lst)
            num2 = -heappop(lst)

            num1 -= 1
            num2 -= 1

            res += 1
            if num1 > 0:
                heappush(lst, -num1)
            if num2 > 0:
                heappush(lst, -num2)

        return res

        