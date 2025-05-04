class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        sum = 0
        for i in range(k):
            sum += nums[i]
        current_sum = sum

        for right in range(k, len(nums)):
            left = right - k

            sum -= nums[left]
            sum += nums[right]

            current_sum = max(current_sum, sum)
        
        return current_sum / k
        
        