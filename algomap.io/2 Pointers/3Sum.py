class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        ans = []
        
        nums.sort()

        for i in range(n-2):
            # 현재 i가 이전 i와 같은 값이면, 이전에 이미 이 값으로 조합을 다 만들었으므로 중복됨 → 스킵
            if i > 0 and nums[i] == nums[i-1]:
                continue

            j, k = i+1, n-1

            while j < k:
                value = nums[i] + nums[j] + nums[k]

                if value == 0:
                    # 조합 찾음
                    ans.append([nums[i], nums[j], nums[k]])
                    
                    # 중복 skip
                    while j < k and nums[j] == nums[j+1]:
                        j += 1
                    
                    while k > j and nums[k] == nums[k-1]:
                        k -= 1

                    # 다음 조합으로 이동
                    j += 1
                    k -= 1
                elif value > 0:
                    k -= 1
                else:
                    j += 1
        
        return ans