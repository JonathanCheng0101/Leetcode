class Solution:
    def findPeakElement(self, nums: List[int]) -> int:
        l, r = 0, len(nums) - 1
        while l < r:
            mid = (l + r)// 2
            if nums[mid] < nums[mid + 1]:
                l = mid + 1 #因為mid 此時不會是峰值不用考慮
            elif nums[mid] > nums[mid + 1]:
                r = mid    #因為mid 此時可能是峰值要考慮

        return r


            

        