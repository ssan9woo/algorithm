class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:
        ans, min_len = '', min(len(str1), len(str2))

        for i in range(1, min_len+1):
            t = str1[:i]
            div_1, div_2 = len(str1) // i, len(str2) // i

            if t * div_1 == str1 and t * div_2 == str2:
                ans = t
        
        return ans