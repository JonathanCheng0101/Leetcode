from collections import Counter
class Solution:
    def findLHS(self, nums: List[int]) -> int:
        nums_cnt = sorted(Counter(nums).items(), key = lambda x:x[0], reverse = False)
        res = 0
        cur = 0
        for i in range(len(nums_cnt)-1):
            if abs(nums_cnt[i][0] - nums_cnt[i + 1][0]) == 1:
                cur += (nums_cnt[i][1] + nums_cnt[i + 1][1])

                res = max(res,cur)
            cur = 0

        return res

