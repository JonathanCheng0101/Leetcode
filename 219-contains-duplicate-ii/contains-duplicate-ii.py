class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        cur = nums[:k+1]
        if len(set(cur)) != len(cur):
            return True
        cur_set = set(cur)

        for i in range(k+1, len(nums)):
            cur_set.remove(nums[i-k-1])
            if nums[i] in cur_set:
                return True
            else:
                cur_set.add(nums[i])

        return False

            

            
