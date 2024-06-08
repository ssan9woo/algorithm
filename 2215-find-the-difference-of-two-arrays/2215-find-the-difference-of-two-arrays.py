class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
        ans1, ans2 = [], []
        dic1 = {x:1 for x in nums1}
        dic2 = {x:1 for x in nums2}
        
        for key in dic1.keys():
            if not key in dic2:
                ans1.append(key)

        for key in dic2.keys():
            if not key in dic1:
                ans2.append(key)

        return [ans1, ans2]