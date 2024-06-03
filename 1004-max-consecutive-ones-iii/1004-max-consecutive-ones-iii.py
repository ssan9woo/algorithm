class Solution:
    def longestOnes(self, nums, k):
        N = len(nums)
        i = 0
        k_cnt = k
        ans = 0
        sub_len = 0

        while i < N:
            if nums[i] == 1:
                sub_len += 1
            else:
                if k_cnt > 0:
                    k_cnt -= 1
                    sub_len += 1
                else:
                    while k_cnt < k or nums[i] == 1:
                        i -= 1
                        if nums[i] == 0:
                            k_cnt += 1

                    sub_len = 0
                    k_cnt = k
            ans = max(ans, sub_len)
            i += 1
        return ans
