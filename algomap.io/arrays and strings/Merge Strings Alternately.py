class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        ans = ""
        max_len = max(len(word1), len(word2))

        for i in range(0, max_len):
            if i < len(word1):
                ans += word1[i]
            
            if i < len(word2):
                ans += word2[i]

        return ans
        