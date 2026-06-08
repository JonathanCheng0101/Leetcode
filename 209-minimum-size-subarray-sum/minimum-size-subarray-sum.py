class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        res = float("inf")

        l = 0
        cur_sum = 0

        for r in range(len(nums)):
            cur_sum += nums[r]

            if cur_sum < target:
                continue
            else:
                while cur_sum >= target and l <= r:
                    res = min(res, r - l + 1)
                    cur_sum -= nums[l]
                    l += 1


        return 0 if res == float("inf") else res




            