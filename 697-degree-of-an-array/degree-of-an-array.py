from collections import Counter
class Solution:
    def findShortestSubArray(self, nums: List[int]) -> int:
        first = {}
        last = {}
        cnt = {}

        for i, num in enumerate(nums):
            cnt[num] = cnt.get(num, 0) + 1

            if num not in first:
                first[num] = i

            
            last[num] = i

        
        max_cnt = max(cnt.values())
        res = float('inf')
        for num in cnt:
            if cnt[num] == max_cnt:
                cur = last[num] - first[num] + 1

                res = min(res, cur)

        return res


        