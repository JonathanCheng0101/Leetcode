class Solution:
    def arrangeCoins(self, n: int) -> int:
        # 假設k 排 找出最大的k  k(k+ 1) / 2 <= n
        l, r = 1, n

        while l <= r:
            mid = (l + r)// 2

            if mid * (mid + 1)/ 2 == n:
                return int(mid)
            elif mid * (mid + 1)/ 2 > n:
                r = mid - 1
            elif mid * (mid + 1)/ 2 < n:
                l = mid + 1

        return int(r)
            
