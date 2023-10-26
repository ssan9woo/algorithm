import Foundation

func getDivisorCount(_ num: Int) -> Int {
    var divisors: Set<Int> = []
    
    let sq = Int(sqrt(Double(num)))
    for i in (1...sq) {
        if num % i == 0 {
            divisors.insert(i)
            divisors.insert(num / i)
        }
    }
    
    return divisors.count
}

func solution(_ left:Int, _ right:Int) -> Int {
    var ans: Int = 0
    
    for i in (left...right) {
        let divisorCount = getDivisorCount(i)
        
        ans += divisorCount % 2 == 0 ? i : -i
    }
    
    return ans
}