from collections import defaultdict, Counter
from heapq import heappop, heapify
class Solution:
    def findXSum(self, nums: List[int], k: int, x: int) -> List[int]:
        res = []
        temp = 0
        window = Counter(nums[:k])
        sorted_window = sorted(window.items(), key = lambda x: (-x[1], -x[0]))[:x]
        for [a,b] in sorted_window:
            temp += a*b
        res.append(temp)
        temp = 0
        l = 0
        for r in range(k, len(nums)):
            window[nums[r]] += 1
            window[nums[l]] -= 1
            l += 1
            sorted_window = sorted(window.items(), key = lambda x: (-x[1], -x[0]))[:x]
            for [a,b] in sorted_window:
                temp += a*b
            res.append(temp)
            temp = 0
        return res
            
        