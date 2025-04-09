class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        ans = []        
        L, R = 0, len(nums)-1

        while L <= R:
            if abs(nums[L]) > abs(nums[R]):
                ans.append(nums[L] * nums[L])
                L += 1
            else:
                ans.append(nums[R] * nums[R])
                R -= 1
        
        return ans[::-1]
