class Solution:
    def isPerfectSquare(self, num: int) -> bool:
        left, right = 1, num

        while left <= right:
            mid = (left + right) // 2
            p = mid * mid

            if p == num:
                return True
            if  < num:
                left = p + 1
            else:
                right = p - 1