class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        common_prefix = ""
        N = len(strs)

        for i in range(len(strs[0])):
            prefix = strs[0][i]

            for j in range(N):
                if i >= len(strs[j]):
                    return common_prefix
                
                if strs[j][i] != prefix:
                    return common_prefix
                
            common_prefix += prefix    
        
        return common_prefix