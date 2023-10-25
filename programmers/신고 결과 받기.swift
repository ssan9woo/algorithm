import Foundation

func solution(_ idList:[String], _ reports:[String], _ k:Int) -> [Int] {
    var reportDict: [String: Set<String>] = Dictionary(uniqueKeysWithValues: idList.map { ($0, []) })
    var mailCountDict: [String: Int] = Dictionary(uniqueKeysWithValues: idList.map { ($0, 0) })
    
    for report in reports {
        let names = report.components(separatedBy: " ")
        let from = names[0]
        let to = names[1]
        
        reportDict[to]!.insert(from)
    }
    
    let reportedUsers = reportDict.filter { $1.count >= k }.keys
    for reportedUser in reportedUsers {
        let reporters = reportDict[reportedUser]!
        
        for reporter in reporters {
            mailCountDict[reporter]! += 1
        }
    }
    
    return idList.map { mailCountDict[$0]! }
}