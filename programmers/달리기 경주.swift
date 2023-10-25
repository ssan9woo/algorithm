import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var rankDict = Dictionary(uniqueKeysWithValues: players.enumerated().map { ($1, $0) })
    
    for calledPlayer in callings {
        let calledPlayerRank = rankDict[calledPlayer]!
        let frontPlayer = players[calledPlayerRank-1]
        
        players.swapAt(calledPlayerRank, calledPlayerRank-1)
        
        rankDict[calledPlayer]! -= 1
        rankDict[frontPlayer]! += 1        
    }
    
    return players
}