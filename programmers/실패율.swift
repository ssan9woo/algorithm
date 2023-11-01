import Foundation

func getStagesDict(_ N: Int, _ stages: [Int]) -> [Int: Double] {
    var stagesDict: [Int: Double] = Dictionary(uniqueKeysWithValues: (1...N).map { ($0, 0) })
    for stage in stages {
        if let _ = stagesDict[stage] {
            stagesDict[stage]! += 1
        }
    }
    
    return stagesDict
}

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stagesDict: [Int: Double] = getStagesDict(N, stages)
    
    var totalPlayerCount: Double = Double(stages.count)
    for i in (1...N) {
        let stagePlayerCount = stagesDict[i]!
        
        stagesDict[i]! = stagePlayerCount == 0 ? 0 : stagePlayerCount / totalPlayerCount
        totalPlayerCount -= stagePlayerCount
    }
    
    return stagesDict.sorted {
        if $0.value == $1.value {
            return $0.key < $1.key
        }
        
        return $0.value > $1.value
    }.map { $0.key }
}