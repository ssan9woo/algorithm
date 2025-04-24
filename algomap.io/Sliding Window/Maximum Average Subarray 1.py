class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        n = len(nums)
        _sum = sum(nums[:k])
        ans = _sum
    
        for i in range(k, n):
            _sum = _sum + nums[i] - nums[i-k]
            ans = max(ans, _sum)
        
        return ans / k