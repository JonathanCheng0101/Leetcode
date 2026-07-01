class NumArray:

    def __init__(self, nums: List[int]):
        self.nums = nums
        self.d = {-1:0} #  index: prefix
        self.prefix = 0
        for i, num in enumerate(nums):
            self.prefix += num
            self.d[i] = self.prefix


    def sumRange(self, left: int, right: int) -> int:
        return self.d[right] - self.d[left-1]

        
            
   

        


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# param_1 = obj.sumRange(left,right)