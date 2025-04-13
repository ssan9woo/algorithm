class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        
        for char in s:
            if char == "]" or char == "}" or char == ")":
                if not stack:
                    return False
                
                if char == "]" and stack[-1] == "[":
                    stack.pop()
                elif char == "}" and stack[-1] == "{":
                    stack.pop()
                elif char == ")" and stack[-1] == "(":
                    stack.pop()
                else:
                    return False
            else:
                stack.append(char)
        
        return True if not stack else False