class Solution:
    def runningSum(self, nums: List[int]) -> List[int]:
        res = [0]

        for i in range(len(nums)):
            res.append(res[-1] + nums[i])

        return res[1:]
        