import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var ans = 0
    let n = board.count
    var stack: [Int] = []
    var board = board
    
    for move in moves {
        let idx = move - 1
        
        for i in (0..<n) {
            if board[i][idx] != 0 {
                let item = board[i][idx]
                
                if let lastItem = stack.last, lastItem == item {
                    stack.removeLast()
                    ans += 2
                } else {
                    stack.append(item)
                }
                
                board[i][idx] = 0
                break
            }
        }
    }

    return ans
}