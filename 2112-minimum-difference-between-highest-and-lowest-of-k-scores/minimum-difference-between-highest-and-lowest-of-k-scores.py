class Solution:
    def minimumDifference(self, nums: List[int], k: int) -> int:
        nums = sorted(nums)

        window = nums[:k]
        diff = max(window) - min(window)
        res = diff

        for i in range(k, len(nums)):
            window.append(nums[i])
            window.pop(0)
            diff = max(window) - min(window)
            res = min(res, diff)

        return res
