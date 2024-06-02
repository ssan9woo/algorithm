class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        N = len(nums)
        sub_sum = sum(nums[:k])
        ans = sub_sum / k

        for i in range(1, N-k+1):
            sub_sum = sub_sum - nums[i-1] + nums[i+k-1]
            ans = max(ans, sub_sum / k)

        return ans