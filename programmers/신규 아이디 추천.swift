import Foundation

func lv1(_ id: String) -> String {
    return id.lowercased()
}

func lv2(_ id: String) -> String {
    let availableWords: [Character] = ["-","_","."]
    
    var result: String = ""
    for char in id {
        if char.isLetter || char.isNumber || availableWords.contains(char) {
            result += String(char)
        }
    }
    
    return result
}

func lv3(_ id: String) -> String {
    var result = id
    
    while result.contains("..") {
        result = result.replacingOccurrences(of: "..", with: ".")
    }
    
    return result
}

func lv4(_ id: String) -> String {
    var result = id
    
    if result.first == "." {
        result.removeFirst()
    }
    
    if result.last == "." {
        result.removeLast()
    }
    
    return result
}

func lv5(_ id: String) -> String {
    return id.isEmpty ? "a" : id
}

func lv6(_ id: String) -> String {
    var result = id
    
    if result.count >= 16 {
        let lastIndex = result.index(result.startIndex, offsetBy: 15)
        result = String(result[result.startIndex..<lastIndex])
    }
    
    if result.last == "." {
        result.removeLast()
    }
    
    return result
}

func lv7(_ id: String) -> String {
    if id.count > 2 {
        return id
    }
    
    return id + String(repeating: id.last!, count: 3 - id.count)
}

func solution(_ new_id:String) -> String {
    var lv_1 = lv1(new_id)
    var lv_2 = lv2(lv_1)
    var lv_3 = lv3(lv_2)
    var lv_4 = lv4(lv_3)
    var lv_5 = lv5(lv_4)
    var lv_6 = lv6(lv_5)
    var lv_7 = lv7(lv_6)
    
    return lv_7
}