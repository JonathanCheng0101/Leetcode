class Solution:
    def smallestIndex(self, nums: List[int]) -> int:
        for i in range(len(nums)):
        
            
            if nums[i] < 10:
                if nums[i] == i:
                    return i
            else:
                total = sum(int(i) for i in str(nums[i]))
                


                if i == total:
                    return i
        
        return -1