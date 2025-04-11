class Solution:
    def isPalindrome(self, s: str) -> bool:
        word = [x for x in s.lower() if x.isalpha() or x.isnumeric()]
        
        if len(word) < 2:
            return True
        
        L, R = 0, len(word)-1

        while L < R:
            if word[L] != word[R]:
                return False
            
            L += 1
            R -= 1
        
        return True
        