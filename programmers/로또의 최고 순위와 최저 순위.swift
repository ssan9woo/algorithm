import Foundation

func getIntersectionCount(_ a: [Int], _ b: [Int]) -> Int {
    return Set(a).intersection(Set(b)).count
}

func getZeroCount(_ lottos: [Int]) -> Int {
    return lottos.filter { $0 == 0 }.count
}

func getRanking(_ num: Int) -> Int {
    return num < 2 ? 6 : 7 - num
}

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let intersectionCount = getIntersectionCount(lottos, win_nums)
    let zeroCount = getZeroCount(lottos)
    
    return [
        getRanking(intersectionCount + zeroCount),
        getRanking(intersectionCount)
    ]
}