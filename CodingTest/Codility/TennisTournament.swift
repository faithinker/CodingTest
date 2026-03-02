//
//  TennisTournament.swift
//  CodingTest
//
//  Created by jhkim on 2026.03.02.
//

import Foundation

/// [TennisTournament](https://app.codility.com/programmers/trainings/3)
class TennisTournament {
    
    public func solution(_ P: Int, _ C: Int) -> Int {
        return min(P / 2, C)
    }

//    print(solution(5, 3)) // 2
//    print(solution(10, 3)) // 3
}
