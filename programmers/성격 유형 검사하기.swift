import Foundation

func solution(_ surveys:[String], _ choices:[Int]) -> String {
    var ans: String = "";
    var categoryDict: [Character: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    
    let n = surveys.count
    
    for i in (0..<n) {
        if choices[i] == 4 {
            continue
        }
        
        let categoryIndex = surveys[i].index(surveys[i].startIndex, offsetBy: Int(choices[i] / 4))
        let category = surveys[i][categoryIndex]
        let score = choices[i] < 4 ? 4 - choices[i] : choices[i] - 4
        categoryDict[category]! += score
    }
    
    ans += categoryDict["R"]! >= categoryDict["T"]! ? "R" : "T"
    ans += categoryDict["C"]! >= categoryDict["F"]! ? "C" : "F"
    ans += categoryDict["J"]! >= categoryDict["M"]! ? "J" : "M"
    ans += categoryDict["A"]! >= categoryDict["N"]! ? "A" : "N"
    
    return ans
}
