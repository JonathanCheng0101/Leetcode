class Solution:
    def shuffle(self, nums: List[int], n: int) -> List[int]:
        res = []
        left, right = 0, n

        for i in range(n):
            res.append(nums[left])
            res.append(nums[right])
            left += 1
            right += 1

        return res
