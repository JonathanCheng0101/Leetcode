class Solution:
    def threeSumClosest(self, nums: List[int], target: int) -> int:
        res = float("inf")
        cnt_diff = float("inf")
        nums = sorted(nums)

        for i in range(len(nums)):
            l, r = i + 1, len(nums) - 1

            while l < r:
                curr = nums[i] + nums[l] + nums[r]
                diff = abs(target - curr)


                if diff < cnt_diff:
                    cnt_diff = diff
                    res = curr

                if curr >= target:
                    r -= 1
                else:
                    l += 1            
        return res




       