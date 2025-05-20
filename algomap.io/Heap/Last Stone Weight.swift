class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var heap: Heap<Int> = []

        for stone in stones {
            heap.insert(stone)
        }

        while heap.count > 1 {
            let first = heap.popMax()!
            let second = heap.popMax()!
            
            if first != second {
                heap.insert(abs(first - second))
            }
        }

        return heap.popMax() ?? 0
    }
}