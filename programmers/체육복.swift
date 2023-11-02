import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var losted = lost.filter { !reserve.contains($0) }
    var reserved = reserve.filter { !lost.contains($0) }.sorted()
    
    for res in reserved {
        if losted.contains(res - 1) {
            losted = losted.filter { $0 != res - 1 }
        } else if losted.contains(res + 1) {
            losted = losted.filter { $0 != res + 1 }
        }  
    }
    
    return n - losted.count
}