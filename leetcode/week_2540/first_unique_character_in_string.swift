/// 첫 번째 순회를 통해 각 문자들이 몇 번이나 사용되었는지 확인
/// 두 번째 순회를 통해 한 번만 사용된 문자가 있는지 확인
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let counter = getCounter(s)
        for (idx, val) in s.enumerated() {
            if counter[val] == 1 {
                return idx
            }
        }
        
        return -1
    }
    
    private func getCounter(_ s: String) -> [Character: Int] {
        return s.reduce(into: [:]) { result, value in
            result[value, default: 0] += 1
        }
    }
}