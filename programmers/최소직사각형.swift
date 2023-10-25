import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var n: Int = 1
    var m: Int = 1
    
    for size in sizes {
        n = max(n, max(size[0], size[1]))
        m = max(m, min(size[0], size[1]))
    }
    
    return n * m
}