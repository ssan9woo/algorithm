import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var ans: Int = 0
    
    for i in (0..<absolutes.count) {
        ans += signs[i] ? absolutes[i] : -absolutes[i]
    }
    
    return ans
}