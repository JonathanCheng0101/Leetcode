class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        cur = set()
        for i in range(len(nums)):
            if nums[i] in cur:
                return True

            cur.add(nums[i])

            if len(cur) + 1 > k + 1:
                cur.remove(nums[i - k])

        return False
            

            
