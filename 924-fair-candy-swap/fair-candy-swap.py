class Solution:
    def fairCandySwap(self, aliceSizes: List[int], bobSizes: List[int]) -> List[int]:
        total = sum(aliceSizes) + sum(bobSizes)
        target = total / 2
        for num in aliceSizes:
            goal =  target + num - sum(aliceSizes)
            if goal in set(bobSizes):
                return [num, goal]