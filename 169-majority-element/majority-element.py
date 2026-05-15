from collections import Counter
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        new_nums = Counter(nums)
        for k,v in new_nums.items():
            if v > len(nums) / 2:
                return k