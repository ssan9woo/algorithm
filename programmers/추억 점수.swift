import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photos:[[String]]) -> [Int] {
    let dict = Dictionary(uniqueKeysWithValues: (0..<name.count).map { (name[$0], yearning[$0]) })
    
    var ans: [Int] = []
    for photo in photos {
        var score = photo.reduce(0) { $0 + (dict[$1] ?? 0) }
        ans.append(score)
    }
    
    return ans
}