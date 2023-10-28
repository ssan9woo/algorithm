import Foundation

let coordinates: [Int: (Int, Int)] = [
    1: (0, 0),
    2: (0, 1),
    3: (0, 2),
    4: (1, 0),
    5: (1, 1),
    6: (1, 2),
    7: (2, 0),
    8: (2, 1),
    9: (2, 2),
    0: (3, 1),
]

func getDistance(_ from: (Int, Int), _ to: (Int, Int)) -> Int {
    return abs(from.0 - to.0) + abs(from.1 - to.1)
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var ans: String = ""
    
    var curLeftCoor: (Int, Int) = (3, 0)
    var curRightCoor: (Int, Int) = (3, 2)
    
    func setLeftFinger(_ number: Int) {
        ans += "L"
        curLeftCoor = coordinates[number]!
    }
    
    func setRightFinger(_ number: Int) {
        ans += "R"
        curRightCoor = coordinates[number]!
    }
    
    for number in numbers {
        if [1, 4, 7].contains(number) {
            setLeftFinger(number)
        } else if [3, 6, 9].contains(number) {
            setRightFinger(number)
        } else {
            let leftDis = getDistance(curLeftCoor, coordinates[number]!)
            let rightDis = getDistance(curRightCoor, coordinates[number]!)
            
            if leftDis == rightDis {
                hand == "right" ? setRightFinger(number) : setLeftFinger(number)
            } else {
                leftDis < rightDis ? setLeftFinger(number) : setRightFinger(number)
            }
        }
    }
    
    return ans
}
