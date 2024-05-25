class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        x = 0

        if s == "": return True

        if t == "": return False
        
        for i in range(len(t)):
            if x > len(s)-1: break
            
            if t[i] == s[x]:
                x += 1
        
        return True if x == len(s) else False