class Solution:
    def closeStrings(self, word1: str, word2: str) -> bool:
        dic1, dic2 = {}, {}

        for s in word1:
            dic1[s] = dic1.get(s, 0) + 1
        
        for s2 in word2:
            dic2[s2] = dic2.get(s2, 0) + 1

        for i in dic1.keys():
            if i not in dic2:
                return False

        return sorted(dic1.values()) == sorted(dic2.values())