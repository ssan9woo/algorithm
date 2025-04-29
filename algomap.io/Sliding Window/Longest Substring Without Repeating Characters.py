class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        left, ans = 0, 0
        alphaIdxMap = {}

        for idx, char in enumerate(s):
            # 새로 추가 할 원소가 이미 substring에 있을 경우
            # 중복 여부는 substring의 범위 내에서만 찾는다
            # left를 중복된 원소 다음 순서로 이동시킴
            if char in alphaIdxMap and alphaIdxMap[char] >= left:
                left = alphaIdxMap[char] + 1
            
            # 중복되지 않은 경우, substring길이 업데이트
            # substring은 left~idx로 이루어짐
            else:
                ans = max(ans, idx - left + 1)
            
            # 원소 및 인덱스 저장
            alphaIdxMap[char] = idx

        return ans