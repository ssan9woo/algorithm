import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var ans: Int64 = 0
    
    for i in (1...count) {
        ans += Int64(price * i)
    }
    
    return ans <= money ? 0 : ans - Int64(money)
}