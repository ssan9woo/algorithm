class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        ans = ""

        for x in strs[0]:
            word = ans + x
            has = not False in [s.startswith(word) for s in strs]

            if has:
                ans += x
        
        return ans
