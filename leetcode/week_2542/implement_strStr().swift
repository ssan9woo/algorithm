class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let ranges = haystack.ranges(of: needle)
        
        if let firstRange = ranges.first {
            let distance = haystack.distance(from: haystack.startIndex, to: firstRange.lowerBound)
            return distance
        }
        
        return -1
    }
}