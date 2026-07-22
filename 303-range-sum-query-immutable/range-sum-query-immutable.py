class NumArray:

    def __init__(self, nums: List[int]):
        self.res = []
        self.prefix = 0
        for num in nums:
            self.prefix += num
            self.res.append(self.prefix)


    def sumRange(self, left: int, right: int) -> int:
        if left == 0:
            return self.res[right]
        else:
            return self.res[right] - self.res[left - 1]


        
            
   

        


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# param_1 = obj.sumRange(left,right)