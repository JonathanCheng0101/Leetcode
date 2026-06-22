class Solution:
    def judgeSquareSum(self, c: int) -> bool:

        for a in range(int(sqrt(c))+ 1):
            # b **2 = c - a **2

            l, r = a, int(sqrt(c))

            while l <= r:
                mid = (l + r) //2

                if mid ** 2  == (c - a **2):
                    return True
                elif mid ** 2  > (c - a **2):
                    r = mid - 1
                
                elif mid ** 2  < (c - a **2):
                    l = mid + 1
        return False
                




            