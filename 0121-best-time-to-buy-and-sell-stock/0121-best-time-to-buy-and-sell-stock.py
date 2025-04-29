class Solution:
    def maxProfit(self, prices: List[int]) -> int:
       l,r = 0, 0
       max_price = 0

       while r < len(prices):
           max_price = max(max_price, prices[r] - prices[l])
           if prices[l] > prices[r]:
                l += 1
           r += 1
       return max_price
                
        