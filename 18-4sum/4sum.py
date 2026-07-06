class Solution:
    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        res = set()
        nums = sorted(nums)
        for i in range(len(nums)):
            for j in range(i + 1, len(nums)):
                l, r = j + 1, len(nums) - 1

                while l < r:

                    if nums[i] + nums[j] + nums[l] + nums[r] == target:
                        res.add((nums[i], nums[j], nums[l], nums[r]))
                        l += 1
                        r -= 1
                    
                    else:
                        if nums[i] + nums[j] + nums[l] + nums[r] > target:
                            r -= 1
                        else:
                            l += 1
        
        return [list(x) for x in res]

                
        