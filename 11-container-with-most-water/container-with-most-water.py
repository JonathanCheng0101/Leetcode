class Solution:
    def maxArea(self, height: List[int]) -> int:
        l, r = 0, len(height) - 1
        capacity = min(height[l], height[r]) * (r - l)
        while l < r:
            if height[r] > height[l]:
                l += 1
            else:
                r -= 1
            
            current = min(height[l], height[r]) * (r - l)

            capacity = max(current, capacity)
        
        return capacity



        