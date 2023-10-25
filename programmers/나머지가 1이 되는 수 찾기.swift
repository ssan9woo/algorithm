import Foundation

func solution(_ n:Int) -> Int {
    var i: Int = 2
    
    while true {
        if n % i == 1 {
            return i
        }
        
        i += 1
    }
    
    return 0
}