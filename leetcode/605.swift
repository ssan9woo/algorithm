// 초기 답안: 각 케이스 별로 구분지어서 처리
class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        let len = flowerbed.count
        var flowerbed = flowerbed
        var flowerCount: Int = 0

        if (len == 1) {
            return (flowerbed[0] == 0 ? 1 : 0) >= n
        }

        if (flowerbed[0] == 0 && flowerbed[1] == 0) {
            flowerbed[0] = 1
            flowerCount += 1
        }

        if (flowerbed[len-1] == 0 && flowerbed[len-2] == 0) {
            flowerbed[len-1] = 1
            flowerCount += 1
        }

        for i in 1..<len-1 {
            if (flowerbed[i] == 0 && flowerbed[i-1] == 0 && flowerbed[i+1] == 0) {
                flowerbed[i] = 1
                flowerCount += 1
            }
        }

        return flowerCount >= n
    }
}

// enumerated와 where절 활용
class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed
        var flowerCount: Int = 0
        
        for (idx, value) in flowerbed.enumerated() where value == 0 {
            let prefixIdx = idx-1, suffixIdx = idx+1
            if prefixIdx >= 0, flowerbed[prefixIdx] == 1 { continue }
            if suffixIdx < flowerbed.count, flowerbed[suffixIdx] == 1 { continue }

            flowerbed[idx] = 1
            flowerCount += 1
        }

        return flowerCount >= n
    }
}