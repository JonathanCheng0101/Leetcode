class Solution:
    def twoSumLessThanK(self, nums: List[int], k: int) -> int:
        # use 2 pointers
        res = -1
        left, right = 0, len(nums) - 1
        nums = sorted(nums)

        while left < right:
            cur = nums[left] + nums[right]
            if cur < k:
                res = max(res, cur)
                left += 1
            else:
                right -= 1

        return res

            