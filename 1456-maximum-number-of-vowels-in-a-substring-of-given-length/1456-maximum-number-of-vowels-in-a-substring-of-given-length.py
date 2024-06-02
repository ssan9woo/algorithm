class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        vowels = ['a','e','i','o','u']
        cnt = 0
        N = len(s)

        seq = s[:k]
        for i in seq:
            if i in vowels:
                cnt += 1

        ans = cnt
        for i in range(1, N-k+1):
            if s[i-1] in vowels:
                cnt -= 1
            
            if s[i-1+k] in vowels:
                cnt += 1

            ans = max(ans, cnt)
        

        return ans