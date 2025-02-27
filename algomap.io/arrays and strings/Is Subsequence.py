class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        # 공백 케이스 처리
        if s == "": return True

        if t == "": return False # s는 이미 empty 일 수 없으므로

        i = 0
        for j in range(0, len(t)):
            if i >= len(s): return True
            
            if t[j] == s[i]:
                i += 1

        return True if i == len(s) else False
        