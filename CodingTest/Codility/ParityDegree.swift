//
//  ParityDegree.swift
//  CodingTest
//
//  Created by jhkim on 2026.03.01.
//

import Foundation

class ParityDegree {
    /// [ParityDegree](https://app.codility.com/programmers/trainings/5/)
    public func solution(_ N : Int) -> Int {
        var num = N
        var count = 0
        
        while num%2 == 0 {
            num /= 2
            count += 1
        }
        
        return count
    }

    //solution(1) // 0
    //solution(16) // 2
    //solution(24) // 3
    //solution(32) // 5
    //solution(1024) // 10
    //solution(1000000000) // 9
}

