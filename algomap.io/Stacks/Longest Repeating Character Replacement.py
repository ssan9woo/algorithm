from collections import defaultdict

class Solution:
    def characterReplacement(self, s: str, k: int) -> int:
        countMap = defaultdict(int)
        left, ans, maxFreq = 0, 0, 0

        for right in range(len(s)):
            # hash update
            countMap[s[right]] += 1
            # 현재 윈도우 기준으로 가장 많이 사용된 문자열 찾기
            maxFreq = max(maxFreq, countMap[s[right]])
            windowLength = right - left + 1

            # 윈도우 길이 - 최대 문자열 개수가 k보다 작거나 같아야 유효한 윈도우
            if windowLength - maxFreq > k:
                # 유효하지 않은 윈도우
                # 윈도우 범위에 포함되지 않는 문자열 hash값 업데이트
                countMap[s[left]] -= 1
                # 한 칸씩 이동: 슬라이딩 윈도우는 윈도우 크기를 최대로 유지 한 채로 윈도우 유효성 검사
                left += 1
            
            newWindowLength = right - left + 1
            ans = max(ans, newWindowLength)
        
        return ans