class Solution:
    def finalPrices(self, prices: List[int]) -> List[int]:
        res = []

        for i in range(len(prices)):
            cur = prices[i]
            discount = 0
            for j in range(i + 1, len(prices)):
                if prices[j] <= cur:
                    discount = prices[j]
                    break

            res.append(cur - discount)
        
        return res
