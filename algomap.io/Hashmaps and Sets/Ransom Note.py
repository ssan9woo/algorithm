from collections import defaultdict

class Solution:
    def makeDict(self, arr) -> dict:
        result = defaultdict(int)
        
        for i in arr:
            result[i] += 1
        return result

    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        ransom_dict, magazine_dict = self.makeDict(ransomNote), self.makeDict(magazine)

        for word in ransomNote:
            if magazine_dict.get(word, 0) > 0:
                magazine_dict[word] -= 1
            else:
                return False

        return True