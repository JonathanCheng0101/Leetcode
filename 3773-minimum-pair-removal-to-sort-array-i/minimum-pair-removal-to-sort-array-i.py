from heapq import heapify, heappop
class Solution:
    def minimumPairRemoval(self, nums: List[int]) -> int:
        res = 0
        while nums != sorted(nums):
            temp_lst = [0]*(len(nums)-1)
            for i in range(len(nums)-1):
                temp_lst[i] = nums[i] + nums[i + 1]

            temp_lst = [(num, i) for i, num in enumerate(temp_lst)]

            heapify(temp_lst)
            (num, i) = heappop(temp_lst)
            nums[i] = num
            nums.pop(i + 1)

            res += 1
        return res

        