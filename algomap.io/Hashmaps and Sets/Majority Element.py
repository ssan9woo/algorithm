class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        table = Counter(nums)
        
        for key in table:
            if table[key] > len(nums) // 2:
                return key
        
        return 0