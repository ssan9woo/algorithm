class Solution:
    def largestAltitude(self, gain: List[int]) -> int:
        ans = 0
        pre_sum = 0

        for g in gain:
            pre_sum += g
            ans = max(ans, pre_sum)
        
        return ans