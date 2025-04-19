# The isBadVersion API is already defined for you.
# def isBadVersion(version: int) -> bool:

class Solution:
    def firstBadVersion(self, n: int) -> int:
        # n번째 version도 min version이 될 수 있으므로 n도 범위에 포함
        left, right = 1, n 

        # n을 포함하는 순간, 무조건 정답은 하나로 수렴한다.
        # 그렇기 때문에 left = right 인 구간에서 끝나도록 설정
        # 탐색을 마치면 두 포인터가 가리키고 있는 원소가 정답
        while left < right:
            mid = (left + right) // 2

            if isBadVersion(mid):
                # right 자체도 정답에 포함될 수 있기 때문에 mid-1로 지정하지 않는것
                right = mid
            else:
                left = mid + 1
        
        return left