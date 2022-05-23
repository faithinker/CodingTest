//
//  Sol_42840.swift
//  CodingTest
//
//  Created by pineone on 2022/05/23.
//

import Foundation

/// [프로그래머스 42840] 모의고사(https://programmers.co.kr/learn/courses/30/lessons/42840)
class Sol_42840 {
    
    init() {
        solution([1,2,3,4,5]) // [1]
        solution([1,3,2,4,2])
    }
    
    func solution(_ answers:[Int]) -> [Int] {
        
        let one = [1, 2, 3, 4, 5]
        let two = [2, 1, 2, 3, 2, 4, 2, 5]
        let three = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
        
        var accumulateSum = Array(repeating: 0, count: 3)
        
        for i in 0..<answers.count {
            if one[i%one.count] == answers[i] {
                accumulateSum[0] += 1
            }
            if two[i%two.count] == answers[i] {
                accumulateSum[1] += 1
            }
            if three[i%three.count] == answers[i] {
                accumulateSum[2] += 1
            }
        }
        
        var result = [Int]()
        
        let max = accumulateSum.max()!
        
        accumulateSum.enumerated().forEach {
            if max == $0.element {
                result.append($0.offset+1)
            }
        }
        
        //print(result)
        
        return result
    }
}
