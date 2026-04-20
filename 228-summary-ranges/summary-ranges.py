class Solution:
    def summaryRanges(self, nums: List[int]) -> List[str]:
        res = []
        temp = ""
        n = len(nums)
        left = 0


        while left < n:
            right = left
            while (right + 1 < n) and nums[right+ 1] == nums[right]+ 1:
                right += 1

            if left == right:
                temp = str(nums[left])
            else:
                temp = str(nums[left]) + "->" + str(nums[right])

            res.append(temp)
            temp = ""
            left = right + 1

        return res

        
