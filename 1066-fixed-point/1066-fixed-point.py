class Solution:
    def fixedPoint(self, arr: List[int]) -> int:
        ans = -1                # default if no fixed point
        l, r = 0, len(arr) - 1
        while l <= r:
            mid = (l + r) // 2
            if arr[mid] == mid:
                ans = mid         # first time you hit arr[mid]==mid, it's the smallest so far
                r = mid - 1
            elif arr[mid] > mid:
                r = mid - 1
            else:
                l = mid + 1
        return ans
