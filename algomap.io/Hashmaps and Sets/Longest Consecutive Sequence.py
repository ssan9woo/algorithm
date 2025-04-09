class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        longest = 0
        nums = set(nums)

        for i in nums:
            if i-1 in nums:
                continue
            
            # 연속 수열의 시작점 부터 수열 찾기
            # 언제까지? -> x+1, x+2 ... x+n이 set에 없을 때 까지
            length = 1
            while i + length in nums:
                length += 1
            
            longest = max(longest, length)
        
        return longest