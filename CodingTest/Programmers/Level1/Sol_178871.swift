//
//  Sol_178871.swift
//  CodingTest
//
//  Created by jhkim on 2023/06/02.
//

import Foundation

// 프로그래머스 178871 [레벨 1] [달리기 경주](https://school.programmers.co.kr/learn/courses/30/lessons/178871)

class Sol_178871 {
    
    func solution(_ players:[String], _ callings:[String]) -> [String] {
        var playerList = players
        var dic = [String: Int]()
        
        players.enumerated().forEach {
            dic[$0.element] = $0.offset
        }
        
        callings.forEach {
            let index = dic[$0]!
            let slowerRunner = playerList[index-1]
            
            playerList[index-1] = $0
            playerList[index] = slowerRunner
            
            dic[slowerRunner] = dic[slowerRunner]! + 1
            dic[$0] = dic[$0]! - 1
        }
        
        return playerList
    }
    
    func call() {
        let s1 = solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"])
        print(s1)
        // ["mumu", "kai", "mine", "soe", "poe"]
    }
    
    // uniqueKeysWithValues => 순서대로 value를 숫자로 만들어줌
    // swapAt 인덱스를 기준으로 바꿔치기 해준다.
    
    func solution2(_ players:[String], _ callings:[String]) -> [String] {
        var answer = players
        var dict: [String : Int] = Dictionary(uniqueKeysWithValues: zip(players, 0..<players.count))
        
        callings.forEach { player in
            let rank = dict[player]!
            let otherPlayer = answer[rank - 1]
            
            answer.swapAt(rank, rank - 1)
            
            dict[player]! -= 1
            dict[otherPlayer]! += 1
        }
        
        return answer
    }
}
