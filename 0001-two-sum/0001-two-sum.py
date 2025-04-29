class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        heapMap = {}
        for i, num in enumerate(nums):
            diff = target - num
            if diff in heapMap:
                return [heapMap[diff], i]
            else:
                heapMap[num] = i


        
