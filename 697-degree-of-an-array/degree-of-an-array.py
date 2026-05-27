from collections import Counter
class Solution:
    def findShortestSubArray(self, nums: List[int]) -> int:
        needs = []
        # [num, freq]
        cnt_nums = Counter(nums)
        max_freq = max(cnt_nums.values())
        
        needs = []
        for num, freq in cnt_nums.items():
            if freq == max_freq:
                needs.append(num)

        res = inf
        
        for need in needs:
            min_index = inf
            max_index = -inf
            for i, num in enumerate(nums):
                if num == need:
                    min_index = min(i, min_index)
                    max_index = max(i, max_index)

            cur = max_index - min_index + 1
            res = min(res, cur)

        return res

        


            

        
