class Solution:
    def maxArea(self, height: List[int]) -> int:
        # use binary search
        l, r = 0, len(height) - 1
        res = 0

        while l < r:
            output = (r - l) * min(height[l], height[r])
            res = max(res, output)

            if height[r] > height[l]:
                l += 1
            else:
                r -= 1

        return res

        





        