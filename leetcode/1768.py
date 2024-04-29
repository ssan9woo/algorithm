# Slicing 연산으로 풀이
class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        ans = ''

        min_len = min(len(word1), len(word2))
        for i in range(min_len):
            ans += word1[i] + word2[i]
        ans += word1[min_len::]
        ans += word2[min_len::]
        return ans

# Two Pointer 풀이
# 이게 속도가 훨씬 빠르고 메모리도 덜 사용함
class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        ans, i, j = '', 0, 0
        len_word1, len_word2 = len(word1), len(word2)

        while i < len_word1 or j < len_word2:
            if i < len_word1:
                ans += word1[i]
                i += 1
            if j < len_word2:
                ans += word2[j]
                j += 1
        
        return ans
