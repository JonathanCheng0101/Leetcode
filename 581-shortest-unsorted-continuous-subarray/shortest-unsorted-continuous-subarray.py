class Solution:
    def findUnsortedSubarray(self, nums: List[int]) -> int:
        n = len(nums)

        max_seen = float('-inf')
        right = -1

        for i in range(n):
            if nums[i] < max_seen:
                right = i
            else:
                max_seen = nums[i]

        left = -1
        min_seen = float('inf')

        for i in range(n-1, -1, -1):
            if nums[i] > min_seen:
                left = i
            else:
                min_seen = nums[i]
        
        if right == -1:
            return 0
        return right - left + 1



        