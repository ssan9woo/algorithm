class Solution:
    def findClosestNumber(self, nums: List[int]) -> int:
        ans = -100001 # 가장 가까운 거리를 갖는 원소

        for i in nums:
            dis = abs(i)
            closest_dis = abs(ans)

            if dis < closest_dis:
                ans = i
            elif dis == closest_dis:
                ans = max(ans, i)

        return ans