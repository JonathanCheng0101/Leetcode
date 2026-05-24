from collections import Counter
class Solution:
    def sumOfUnique(self, nums: List[int]) -> int:
        res = 0
        nums_cnt = Counter(nums)
        for num, freq in nums_cnt.items(): 
            if freq == 1:
                res += num
            else:
                continue

        return res