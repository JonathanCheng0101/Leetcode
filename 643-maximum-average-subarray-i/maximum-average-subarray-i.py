class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        s = sum(nums[:k])
        res = s

        for right in range(k, len(nums)):
            s += nums[right]
            s -= nums[right - k]

            res = max(res, s)

        return res/ k


