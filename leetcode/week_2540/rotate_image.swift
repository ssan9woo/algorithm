/// 규칙을 찾는 방법
///   - 회전 전과 후의 index를 비교하며, 공통적인 패턴을 찾는다.
/// 
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        // 1. 전치 (Transpose): (i, j) -> (j, i)
        transpose(&matrix)
        
        // 2. 행 반전 (Reverse Rows/Horizontal Flip): (j, i) -> (j, n-1-i)
        flipHorizontal(&matrix)
    }
    
    private func transpose(_ matrix: inout [[Int]]) {
        let n = matrix.count
        
        // 주대각선 위쪽만 순회하며 교환
        for i in 0..<n {
            for j in i+1..<n {
                // 튜플 스와핑은 Swift에서 가장 관용적인 교환 방식
                (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
            }
        }
    }
    
    private func flipHorizontal(_ matrix: inout [[Int]]) {
        // 각 행에 대해 Array의 reverse() 메서드 사용 (가장 간결하고 추상화된 방법)
        for i in 0..<matrix.count {
            matrix[i].reverse()
        }
        
        // 만약 직접 구현을 고수한다면, 아래와 같이 튜플 스와핑을 적용합니다:
        /*
        let n = matrix.count
        for i in 0..<n {
            for j in 0..<n/2 { 
                (matrix[i][j], matrix[i][n-1-j]) = (matrix[i][n-1-j], matrix[i][j])
            }
        }
        */
    }
}