class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        # 若都不是0相安無事,碰到0 slow stays, fast goes
        l = 0
        for r in range(len(nums)):
            if nums[r]: # none zero 的時候進行swap，l == r的時候swap也沒差
                nums[l], nums[r] = nums[r], nums[l]

                l += 1        
        
            

            

        