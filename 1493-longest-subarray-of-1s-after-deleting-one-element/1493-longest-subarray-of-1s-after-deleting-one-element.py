class Solution:
    def longestSubarray(self, nums: List[int]) -> int:
        last_zero_idx, sub_arr_len, ans = -1, 0, 0

        for i in range(len(nums)):
            if nums[i] == 1:
                sub_arr_len += 1
            else:
                ans = max(ans, sub_arr_len)
                sub_arr_len = i - last_zero_idx - 1
                last_zero_idx = i
        
        if last_zero_idx == -1:
            sub_arr_len -= 1
        ans = max(ans, sub_arr_len)
        
        return ans