class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        m, n = len(matrix), len(matrix[0])

        left, right = 0, m*n-1
        while left <= right:
            mid = (left + right) // 2
            
            i, j = mid // n, mid % n
            value = matrix[i][j]

            if target == value:
                return True
            elif target > value:
                left = mid + 1
            else:
                right = mid - 1
        
        return False