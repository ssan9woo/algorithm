class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        n = len(nums)
        idx_dict = {}

        for i in range(n):
            req = target - nums[i]

            if req in idx_dict:
                return [idx_dict[req], i]
            
            idx_dict[nums[i]] = i
        
        return []