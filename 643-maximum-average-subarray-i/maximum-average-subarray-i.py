class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        window = sum(nums[:k])

        res = window
        l = 0

        for i in range(k, len(nums)):
            window += nums[i]
            window -= nums[l]
            l += 1

            res = max(res, window)

        
        return res/k
        