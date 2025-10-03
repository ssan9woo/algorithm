/// 처음엔 각 인덱스에 해당하는 가로, 세로, 3x3 배열을 찾아서, 해당 배열에 중복된 수가 있는지 판별려고 생각함.
/// 각 셀에 해당하는 배열을 뽑아서 연산을 하기는 너무 비 효율적일 것 같다고 생각함.
/// 각 셀이 포함되어 있는 영역에 대해 해시맵을 만들고, 해당 해시에서 중복 된 숫자가 검출되는지 확인하는 방식으로 설계
/// - matrixHash의 index를 찾는 과정이 빠르지 못했음.
///
/// 시간 복잡도: O(N^2), 공간 복잡도: (3*N*N) -> O(N^2)
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowHashList: [[Character: Int]] = Array(repeating: [:], count: 9)
        var colHashList: [[Character: Int]] = Array(repeating: [:], count: 9)
        var matHashList: [[Character: Int]] = Array(repeating: [:], count: 9)
        
        for i in 0..<9 {
            for j in 0..<9 {
                let value = board[i][j]
                if value == "." { continue }
                
                guard rowHashList[i][value] == nil else { return false }
                rowHashList[i][value] = 1
                
                guard colHashList[j][value] == nil else { return false }
                colHashList[j][value] = 1
                
                let idx = (i/3)*3 + j/3
                guard matHashList[idx][value] == nil else { return false }
                matHashList[idx][value] = 1
            }
        }
        
        return true
    }
}

/// solution2 (set 풀이)
/// gemini를 통해 코드 효율성을 확인 한 결과, set으로 풀이하는게 더 적절하다고 판단.
/// 위 풀이에서, dictionary의 value는 특정 Key가 포함되었는지 확인하는 용도로만 사용하고 있음
/// Set의 contains 메소드는 O(1)의 시간 복잡도를 갖기 때문에, set으로 풀면 조금 더 깔끔하게 풀이할 수 있음.
/// ///
/// 시간 복잡도: O(N^2), 공간 복잡도: (3*N*N) -> O(N^2)
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowSet: [Set<Character>] = Array(repeating: Set<Character>(), count: 9)
        var colSet: [Set<Character>] = Array(repeating: Set<Character>(), count: 9)
        var matSet: [Set<Character>] = Array(repeating: Set<Character>(), count: 9)
        
        for i in 0..<9 {
            for j in 0..<9 {
                let value = board[i][j]
                if value == "." { continue }
                
                let setIndex = (i / 3) * 3 + (j / 3)
                if rowSet[i].contains(value) ||
                    colSet[j].contains(value) || matSet[setIndex].contains(value) {
                    return false
                }
                
                rowSet[i].insert(value)
                colSet[j].insert(value)
                matSet[setIndex].insert(value)
            }
        }
        
        return true
    }
}