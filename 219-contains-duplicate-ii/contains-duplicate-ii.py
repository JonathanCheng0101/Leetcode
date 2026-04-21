class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        
        lst = set()

        for i in range(len(nums)):
            if nums[i] in lst:
                return True
            
            lst.add(nums[i])
            if len(lst)> k:
                lst.remove(nums[i-k])

        return False

        