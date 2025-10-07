/// replacing은 첫 번째 인자로 RegexProtocol 을 채택하는 타입을 정규식으로 받을 수 있음
/// 여기선 String literal(/[^a-z0-9]+/)이 자동으로 정규식으로 변환되어 사용됨.
/// '/.../' 형식으로 정규식 구성
/// 
/// input 길이가 길지 않기 때문에, 별도의 알고리즘을 사용하지 않고 reversed를 사용
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let lowercased = s.lowercased()
        let replaced = lowercased.replacing(/[^a-z0-9]+/, with: "")
        
        return replaced == String(replaced.reversed())
    }
}