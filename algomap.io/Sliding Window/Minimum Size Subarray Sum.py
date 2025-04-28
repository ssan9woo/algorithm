class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        left, subArrSum, ans = 0, 0, len(nums) + 1

        for right in range(len(nums)):
            # sum 값 구하기
            subArrSum += nums[right]

            # 유효한 window 일 때
            while subArrSum >= target:
                # 최소 subarray 길이 갱신
                ans = min(ans, right - left + 1)
                # window 사이즈 줄이기 -> left를 다음 index로 이동
                subArrSum -= nums[left]
                left += 1
            
        return ans if ans != len(nums) + 1 else 0