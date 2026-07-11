class Solution:
    def maxArea(self, height: List[int]) -> int:
        l, r = 0, len(height) - 1
        res = 0

        while l < r:
            l_height = height[l]
            r_height = height[r]

            res = max(res, min(l_height, r_height) * (r - l))

            if l_height <= r_height:
                l += 1
            
            else:
                r -= 1

        
        return res





        