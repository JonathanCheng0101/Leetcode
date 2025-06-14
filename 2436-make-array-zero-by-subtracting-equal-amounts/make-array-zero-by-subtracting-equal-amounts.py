from heapq import heappop, heapify
class Solution:
    def minimumOperations(self, nums: List[int]) -> int:

        total = 0  

        while len(nums) > 0:
            nums = [num for num in nums if num != 0]  
            heapify(nums)
            if not nums:
                break
            red = heappop(nums)  #
            nums = [num - red for num in nums]

            total += 1

        return total


        