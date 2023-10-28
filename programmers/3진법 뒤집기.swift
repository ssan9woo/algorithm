import Foundation

func solution(_ n:Int) -> Int {
    return String(n, radix: 3).enumerated().map { Int(String($1))! * Int(pow(3, Double($0))) }.reduce(0, +)
}