class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        res = []
        seen = set()

        nums = sorted(nums)
        l, r = 0, len(nums) - 1

        for i in range(len(nums)):
            target = - nums[i]
            l, r = i + 1, len(nums) - 1

            while l < r:
                if nums[l] + nums[r] == target:
                    if (nums[l], nums[r], nums[i]) not in seen:
                        seen.add((nums[l], nums[r], nums[i]))
                        res.append((nums[l], nums[r], nums[i]))
                    
                    l += 1
                    r -= 1
                elif nums[l] + nums[r] > target:
                    r -= 1
                else:
                    l += 1
        
        return res
        


            
            
       