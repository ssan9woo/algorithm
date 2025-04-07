class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        direction = [(0,1), (1,0), (0,-1), (-1,0)]
        ans = []
        
        M, N = len(matrix), len(matrix[0])
        visit_matrix = [[0 for _ in range(N)] for _ in range(M)]

        coor = (0,0)
        visit_count = 0
        direction_idx = 0

        while visit_count < M * N:
            y, x = coor[0], coor[1]
            
            # 방문
            ans.append(matrix[y][x])
            visit_matrix[y][x] = 1
            visit_count += 1

            # 다음 좌표 구하기
            d = direction[direction_idx]
            next_coor = (coor[0] + d[0], coor[1] + d[1])
            
            next_y, next_x = next_coor[0], next_coor[1]
            is_out_of_range = not (0 <= next_y < M and 0 <= next_x < N)
            already_visit = False if is_out_of_range else visit_matrix[next_y][next_x] == 1

            # 좌표가 out of range 거나 이미 방문했다면
            if is_out_of_range or already_visit:
                # 방향을 변경해줌
                direction_idx = (direction_idx + 1) % len(direction)
                
                # 다음 좌표 위치도 수정
                d = direction[direction_idx]
                next_coor = (coor[0] + d[0], coor[1] + d[1])
            
            # 다음 좌표로 이동
            coor = next_coor

        return ans