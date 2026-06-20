class Solution:
    def mySqrt(self, x: int) -> int:
        target = x

        l, r = 1, x

        while l <= r:
            mid = (l + r) // 2
            if mid ** 2 == target: 
                return mid
            elif mid ** 2 > target: 
                r = mid - 1
            else:
                l = mid + 1

        return int(r)
            


        