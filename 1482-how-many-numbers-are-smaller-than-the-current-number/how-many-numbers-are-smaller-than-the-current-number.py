class Solution:
    def smallerNumbersThanCurrent(self, nums: List[int]) -> List[int]:
        d = {}
        res = []

        sorted_nums = sorted(nums, reverse = False)

        for i, ele in enumerate(sorted_nums):
            if ele not in d:
                d[ele] = i
            
        for num in nums:
            res.append(d[num])

        return res