from collections import defaultdict, Counter
from heapq import heappop, heapify
class Solution:
    def findXSum(self, nums: List[int], k: int, x: int) -> List[int]:
        res = []
        for i in range(len(nums)- k + 1):
            new_num = nums[i:i+k]
            counter = Counter(new_num)

            if len(counter) < x:
                res.append(sum(new_num))
                continue

            cnt = 0

            lst = [(-freq, -num) for num, freq in counter.items()]
            heapify(lst)
            
            for _ in range(x):
                freq, num = heappop(lst)
                cnt += (-freq) *(-num)

            res.append(cnt)

        return res

        


        