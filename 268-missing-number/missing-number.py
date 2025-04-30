class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        vector = [-1] * (len(nums) + 1)
        for num in nums:
            vector[num] = num
        for i, num in enumerate(vector):
            if num == -1:
                return i        