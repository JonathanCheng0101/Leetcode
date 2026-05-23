class Solution:
    def findErrorNums(self, nums: List[int]) -> List[int]:
        twice = sum(nums) - sum(set(nums)) # occur twice

        normal = [i for i in range(1, len(nums) + 1)]
        missing = list(set(normal) - set(nums))[0]
        return [twice, missing]
        