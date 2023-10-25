import Foundation

func solution(_ numbers:[Int]) -> Int {
    45 - numbers.reduce(0) { $0 + $1 }
}