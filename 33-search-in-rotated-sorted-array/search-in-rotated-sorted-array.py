class Solution:
    def search(self, nums: List[int], target: int) -> int:
        l, r = 0, len(nums) - 1

        while l <= r:
            mid = (l + r)// 2

            if nums[mid] == target:
                return mid
            
            # 找正常排序
            elif nums[mid] >= nums[l]:
                # 左邊正常排序 找左邊
                if nums[mid] >= target >= nums[l]:
                    r = mid - 1
                else:
                    l = mid + 1

            elif nums[mid] <= nums[r]:
                # 右邊正常排序 找右邊
                if nums[mid] <= target <= nums[r]:
                    l = mid + 1
                else:
                    r = mid - 1         
                    

        return -1


            


            
       