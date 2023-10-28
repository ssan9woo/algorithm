import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var ans: Set<Int> = []
    
    let n = numbers.count
    for i in (0..<n) {
        for j in (0..<n) {
            if i != j {
                ans.insert(numbers[i] + numbers[j])
            }
        }
    }
    
    return ans.sorted()
}