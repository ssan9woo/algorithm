class Solution:
    def maxOperations(self, nums: List[int], k: int) -> int:
        ans = 0
        nums = sorted(nums)
        N = len(nums)
        L, R = 0, N-1

        while L < R:
            x = nums[L] + nums[R]
            if x == k:
                ans += 1
                nums[L] = 0
                nums[R] = 0
                L += 1
                R -= 1
            else:
                if x > k:
                    R -= 1
                else:
                    L += 1
        
        return ans