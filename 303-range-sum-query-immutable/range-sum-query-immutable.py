class NumArray:

    def __init__(self, nums: List[int]):
        self.nums = nums
        self.res = 0

    def sumRange(self, left: int, right: int) -> int:
        self.res = 0
        for i in range(right + 1):
            self.res += self.nums[i]
        if left != 0:
            for i in range(left):
                self.res -= self.nums[i]
        
        return self.res

        


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# param_1 = obj.sumRange(left,right)