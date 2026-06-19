class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        if target not in set(nums):
            return [-1, -1]
        res = []
        
        def lower_bound(x):
            l, r = 0, len(nums) - 1

            while l <= r:
                mid = (l + r) // 2

                if nums[mid] >= x:
                    r = mid - 1
                else:
                    l = mid + 1

            return l

        left = lower_bound(target)
        right = lower_bound(target + 1) - 1

        if left <= right:
            return [left, right]
        