class Solution:
    def convertToRange(self, stack: List[int]) -> str:
        if not stack: return ""

        if stack[0] == stack[-1]:
            return str(stack[0])
        
        return str(stack[0]) + "->" + str(stack[-1])
        
    def summaryRanges(self, nums: List[int]) -> List[str]:
        stack = []
        ans = []

        for i in nums:
            if not stack:
                stack.append(i)
            else:
                if i == stack[-1] + 1:
                    stack.append(i)
                else:
                    ans.append(self.convertToRange(stack))
                    stack = [i]
        
        if stack:
            ans.append(self.convertToRange(stack))
        
        return ans