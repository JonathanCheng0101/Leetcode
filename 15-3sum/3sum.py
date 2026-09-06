class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        res = set()
        nums = sorted(nums)

        for i, ele in enumerate(nums):
            cur = ele
            target = -cur

            l, r = i + 1, len(nums) - 1

            while l < r:
                if nums[l] + nums[r] == target:

                    res.add((ele, nums[l], nums[r]))
                    l += 1
                    r -= 1
                
                elif nums[l] + nums[r] > target:
                    r -= 1
                else:
                    l += 1
        
        return [list(x) for x in res]