/// - 가장 짧은 문자열을 기준으로 다른 문자열들과 prefix 비교
/// - loop 내부에서 String 인덱싱을 하는 건 좋지 않다.
/// - 추가적인 정렬 비용 발생 `O(nlogn)`
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        // 1. 문자열 크기 순 정렬
        let arr = strs.sorted { $0.count < $1.count }

        // 2. 가장 첫 번째 문자열 확인 -> empty 이면 return
        guard let first = arr.first, !first.isEmpty else {
            return ""
        }

        // 3. 첫 번째 문자열(최소 길이 1이상) for loop 돌리기
        for (idx, char) in first.enumerated() {
            for str in strs {
                // str의 idx에 해당하는 문자와, char 가 같은지 확인
                let strIdx = str.index(str.startIndex, offsetBy: idx)
                let strChar = str[strIdx]
                guard strChar == char else {
                    // str의 start ..< idx 까지의 substring이 답안
                    return String(str[str.startIndex..<strIdx])
                }
            }
        }

        return first
    }
}

/// - 첫 번째 원소로 prefix 설정
/// - strs를 순회하며, 바라보는 문자열이 해당하는 prefix를 갖고있는지 확인
/// - 해당하는 prefix를 갖고있지 않다면, 가질 때 까지 prefix를 줄여가면서 확인
/// - prefix 가 empty 가 되는 종료 조건을 생각해야 함.
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let first = strs.first, !first.isEmpty else {
            return ""
        }

        var prefix = first

        for i in 1..<strs.count {
            while !strs[i].hasPrefix(prefix) {
                guard !prefix.isEmpty else { return "" }
                prefix = String(prefix.dropLast())
            }
        }

        return prefix
    }
}