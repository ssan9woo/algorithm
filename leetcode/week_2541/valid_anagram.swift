/// Character.asciiValue 사용하면 ascii value 찾을 수 있음
/// 
/// 처음에는 해싱으로 풀었는데, 딕셔너리 길이가 다를 수 있어서, 그냥 고정된 알파벳 배열로 풀이
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sArray = getAlphaArray(s)
        let tArray = getAlphaArray(t)

        for i in 0..<sArray.count {
            if sArray[i] != tArray[i] {
                return false
            }
        }

        return true
    }

    private func getAlphaArray(_ str: String) -> Array<Int> {
        var arr = Array(repeating: 0, count: 26)

        for char in str {
            if let ascii = char.asciiValue {
                let value = Int(ascii)
                arr[value - 97] += 1
            }
        }
        
        return arr
    }
}