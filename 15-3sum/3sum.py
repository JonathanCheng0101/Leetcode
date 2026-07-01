class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        nums = sorted(nums)
        res = set()
        for i in range(len(nums)):
            l, r = i + 1, len(nums) - 1

            while l < r:
                if nums[l] + nums[r] == -nums[i]:
                    res.add((nums[i], nums[l], nums[r]))
                    l += 1
                    r -= 1
                
                else:
                    s = nums[l] + nums[r]
                    if s > -nums[i]:
                        r -= 1
                    else:
                        l += 1
                    
        return [list(x) for x in res]

