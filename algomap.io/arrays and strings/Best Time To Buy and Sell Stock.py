class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        profit, min_price = 0, 10001

        for price in prices:
            if price < min_price:
                min_price = price
            
            cur_profit = price - min_price

            if cur_profit > profit:
                profit = cur_profit
        
        return profit