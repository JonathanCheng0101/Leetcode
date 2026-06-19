class Solution:
    def search(self, nums: List[int], target: int) -> int:
        l = 0
        r = len(nums) - 1
        res = -1
        

        while l <= r:
            mid = (l + r) // 2
            if nums[mid] == target:
                res = mid
                return res
            elif nums[mid] > target:
                r = mid - 1

            elif nums[mid] < target:
                l = mid + 1

        
        return res

        