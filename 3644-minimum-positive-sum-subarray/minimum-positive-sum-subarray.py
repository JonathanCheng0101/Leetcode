class Solution:
    def minimumSumSubarray(self, nums: List[int], l: int, r: int) -> int:
        res = float("inf")

        def find_sum(nums, k):
            best = float("inf")
            window = nums[:k]
            cur_sum = sum(window)
            if cur_sum > 0:
                best = cur_sum

            for i in range(k, len(nums)):
                cur_sum += nums[i]
                cur_sum -= nums[i - k]

                if cur_sum > 0:
                    best = min(best, cur_sum)

            return best

        for k in range(l, r + 1):
            res = min(res, find_sum(nums, k))

        if res == float("inf"):
            return -1
        else:
            return res

        