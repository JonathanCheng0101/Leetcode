class Solution:
    def numRescueBoats(self, people: List[int], limit: int) -> int:
        nums = sorted(people)
        res = 0
        l, r = 0, len(nums) - 1

        while l <= r:
            if nums[l] + nums[r] > limit:
                res += 1
                r -= 1
            
            else:
                r -= 1
                l += 1
                res += 1

        return res
       