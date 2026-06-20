class Solution:
    def findMin(self, nums: List[int]) -> int:
        l, r = 0, len(nums) - 1
        

        while l < r:
            mid = (l + r)// 2

            if nums[mid]> nums[r]:
                #最小值在右邊
                l = mid + 1
            
            else:
                #最小值在左邊
                r = mid

        return nums[l]
