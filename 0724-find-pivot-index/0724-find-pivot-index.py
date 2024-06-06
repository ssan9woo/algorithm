class Solution:
    def pivotIndex(self, nums: List[int]) -> int:
        N = len(nums)
        left_pre_sum_arr, right_pre_sum_arr = [0 for x in range(N)], [0 for x in range(N)]

        pre_sum = 0
        for i in range(N):
            pre_sum += nums[i]
            left_pre_sum_arr[i] = pre_sum

        pre_sum = 0
        for i in range(N-1, -1, -1):
            pre_sum += nums[i]
            right_pre_sum_arr[i] = pre_sum

        for i in range(N):
            left = 0 if i == 0 else left_pre_sum_arr[i-1]
            right = 0 if i == N-1 else right_pre_sum_arr[i+1]

            if left == right:
                return i

        return -1