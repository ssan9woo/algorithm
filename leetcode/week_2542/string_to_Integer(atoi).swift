class Solution {
    func myAtoi(_ s: String) -> Int {
        var processedString = s
        var result: Int = 0

        processedString = phase1(processedString)

        let (phase2ResultString, sign) = phase2(processedString)
        processedString = phase2ResultString

        processedString = phase3(processedString)
        
        result = phase4(removeLeadingZero(processedString), sign)
        
        return result
    }
    
    /// Whitespace: Ignore any leading whitespace (" ").
    private func phase1(_ s: String) -> String {
        for (idx, char) in s.enumerated() {
            if char != " " {
                let start = s.index(s.startIndex, offsetBy: idx)
                let end = s.endIndex
                return String(s[start..<end])
            }
        }
        
        return s
    }
    
    /// Signedness: Determine the sign by checking if the next character is '-' or '+', assuming positivity if neither present.
    private func phase2(_ s: String) -> (String, Int) {
        if let char = s.first {
            if char == "+" || char == "-" {
                let start = s.index(s.startIndex, offsetBy: 1)
                let processed = s[start...]
                
                return (String(processed), char == "-" ? -1 : 1)
            }
        }

        return (s, 1)
    }
    
    /// Conversion: Read the integer by skipping leading zeros until a non-digit character is encountered or the end of the string is reached. If no digits were read, then the result is 0.
    private func phase3(_ s: String) -> String {
        var result: String = ""

        for char in s {
            guard char.isNumber else {
                return result
            }
            result += String(char)
        }

        return result
    }
    
    /// Rounding: If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then round the integer to remain in the range. Specifically, integers less than -231 should be rounded to -231, and integers greater than 231 - 1 should be rounded to 231 - 1.
    private func phase4(_ s: String, _ sign: Int) -> Int {
        let min32 = Int(Int32.min)
        let max32 = Int(Int32.max)
        let max64_abs_str = String(Int64.max)
        let min64_abs_str = "9223372036854775808"

        let limitString = sign > 0 ? max64_abs_str : min64_abs_str
        
        if s.count > limitString.count {
            print("range issue")
            return sign < 0 ? min32 : max32
        }

        if s.count == limitString.count {
            if s > limitString {
                return sign < 0 ? min32 : max32
            }
        }

        let value = (Int(s) ?? 0) * sign
        if value > max32 {
            return max32
        }

        if value < min32 {
            return min32
        }

        return value
    }
    

    private func removeLeadingZero(_ s: String) -> String {
        var result = ""

        for (idx, char) in s.enumerated() {
            guard char == "0" else {
                let start = s.index(s.startIndex, offsetBy: idx)
                return String(s[start...])
            }
            result += String(char)
        }

        return result
    }
}