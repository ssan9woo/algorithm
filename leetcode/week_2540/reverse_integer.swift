/// String.reversed() 는 ReversedCollection 타입을 return 한다.
/// lazy excution 방식으로 최적화 하기 위함.
/// 
/// reversed() 할 때, 바로 문자열을 뒤집는게 아니고, 기존의 문자열을 참조만 하고 있다가,
/// 나중에 실제로 collection에 접근할 때, 데이터를 역순으로 제공함. -> 시간 및 메모리 최적화
class Solution {
    func reverse(_ x: Int) -> Int {
        let isNegative = x < 0
        let strValue = String(String(abs(x)).reversed())

        if let value = Int32(strValue) {
            let reversedInt32 = isNegative ? value * -1 : value
            return Int(reversedInt32)
        } else {
            return 0
        }
    }
}