class Solution:
    def trap(self, height: List[int]) -> int:
        water = 0

        n = len(height)
        L, R = 0, n - 1
        L_max, R_max = height[0], height[n-1]

        while L < R:
            if height[L] < height[R]:
                water += max(0, L_max - height[L])
                L_max = max(L_max, height[L])
                L += 1
            else:
                water += max(0, R_max - height[R])
                R_max = max(R_max, height[R])
                R -= 1
        
        return water
        