class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        mul1, mul2 = [], []
        curr = 1
        for num in nums:
            
            mul1.append(curr)
            curr *= num
        

        curr = 1
        for i in range(len(nums)-1, -1, -1):
            
            mul2.append(curr)
            curr *= nums[i]
        mul2.reverse()
            

        res = []
        for i in range(len(nums)):
            total_num = mul1[i] * mul2[i]
            res.append(total_num)

        return res

        