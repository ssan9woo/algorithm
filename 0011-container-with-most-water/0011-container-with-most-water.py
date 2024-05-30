class Solution:
    def maxArea(self, height: List[int]) -> int:
        ans = 0
        N = len(height)
        L, R = 0, N-1

        while L < R:
            water = (R - L) * min(height[L], height[R])
            ans = max(ans, water)

            if height[L] <= height[R]:
                L += 1
            else: 
                R -= 1
        
        return ans