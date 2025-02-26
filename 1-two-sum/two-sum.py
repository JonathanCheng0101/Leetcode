class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        hashMap = {}

        for index, num in enumerate(nums):
            goal = target - num
            if goal not in hashMap:
                # need to add num in to hashMap because this is not the one
                hashMap[num] = index
            else:
                return [index, hashMap[goal]]


        
