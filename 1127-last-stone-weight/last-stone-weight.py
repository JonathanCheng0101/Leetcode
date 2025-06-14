from heapq import heappop, heappush, heapify
class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        if not stones:
            return 0
        stones = [-stone for stone in stones]
        heapify(stones)
        while len(stones) > 1:
            x = heappop(stones)
            y = heappop(stones)

            if x == y:
                continue
            else:
                heappush(stones, -abs(x-y))

        return -stones[0] if stones else 0


        