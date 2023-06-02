//
//  Sol_181188.swift
//  CodingTest
//
//  Created by jhkim on 2023/06/02.
//

import Foundation

// 프로그래머스 181188 [레벨 2] [요격 시스템](https://school.programmers.co.kr/learn/courses/30/lessons/181188) -  실패!

class Sol_181188 {
    
    func solution(_ targets:[[Int]]) -> Int {
        var ans = 0
        let sorted = targets.sorted(by: { $0[1] < $1[1] })
        var end = sorted[0][1]

        for target in sorted {
            if target[0] >= end {
                end = target[1]
                ans += 1
            }
        }
        return ans + 1
    }
    
    
    func call() {
        print(solution([[4,5],[4,8],[10,14],[11,13],[5,12],[3,7],[1,4]])) // 3
    }
}

