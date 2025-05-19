class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        l, r = 0, k - 1
        sum = 0
        for i in range(k):
            sum += nums[i]
            res  = sum / k

        while r + 1 <= len(nums) - 1:
            
            sum -= nums[l]
            sum += nums[r + 1]

            res = max(res, sum/k)

            l += 1
            r += 1
    
            

        return res

