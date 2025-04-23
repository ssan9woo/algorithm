class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        left, right = 1, max(piles)
        ans = right

        while left <= right:
            mid = (left + right) // 2

            # mid개를 먹었을 때 총 걸리는 시간
            total_hour = 0
            for i in piles:
                total_hour += ceil(i / mid)
            
            # 기준 시간보다 더 빨리 먹으면 한 번에 먹는 양을 줄여야 함
            if total_hour <= h:
                ans = mid
                right = mid - 1
            # 기준 시간보다 더 느리게 먹으면 한 번에 먹는 양을 늘려야 함
            else:
                left = mid + 1
            
        return ans