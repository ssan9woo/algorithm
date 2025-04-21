class Solution:
    def findMin(self, nums: List[int]) -> int:
        # len 은 o(1)임
        n = len(nums)
        rotateCount = 0

        left, right = 1, n
        while left <= right:
            mid = (left + right) // 2
            idx = mid % n

            if nums[0] < nums[idx]:
                # 더 많이 돌림
                left = mid + 1
            else:
                # 작거나 같다면
                right = mid - 1
                rotateCount = mid
        
        return nums[rotateCount % n]