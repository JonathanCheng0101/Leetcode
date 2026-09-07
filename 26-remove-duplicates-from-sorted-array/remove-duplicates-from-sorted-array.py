class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        # fast：掃描員，負責把每個原始元素看過一遍。
        # slow：寫入員，指向「下一個應該保留元素要放的位置」

        slow = 1

        for fast in range(1, len(nums)):
            if nums[fast] != nums[slow - 1]:
                nums[slow] = nums[fast]
                slow += 1
        
        return slow