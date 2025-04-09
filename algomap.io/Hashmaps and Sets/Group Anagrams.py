class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        table = defaultdict(list)

        for s in strs:
            key = "".join(sorted(s))
            table[key].append(s)
        
        return list(table.values())