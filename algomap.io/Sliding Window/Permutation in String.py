class Solution:
    def checkInclusion(self, s1: str, s2: str) -> bool:
        left = 0
        s1_hash = {chr(i): 0 for i in range(97, 123)}
        s2_hash = {chr(i): 0 for i in range(97, 123)}

        for i in s1:
            s1_hash[i] += 1

        for right in range(len(s2)):
            s2_hash[s2[right]] += 1

            if right - left + 1 == len(s1):
                if s1_hash == s2_hash:
                    return True
                else:
                    s2_hash[s2[left]] -= 1
                    left += 1
        return False