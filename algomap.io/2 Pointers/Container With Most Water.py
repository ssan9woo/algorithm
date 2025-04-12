class Solution:
    def maxArea(self, height: List[int]) -> int:
        
        water = 0
        l = 0
        r = len(height)-1

        while l < r:

            h = min(height[l], height[r])

            water = max(water, h*(r-l))

            while height[l] <= h and l < r:
                l += 1
            while height[r] <= h and l < r:
                r -= 1
        
        return water