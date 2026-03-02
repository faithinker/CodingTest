//
//  StrSymmetryPoint.swift
//  CodingTest
//
//  Created by jhkim on 2026.03.02.
//

import Foundation

/// [StrSymmetryPoint](https://app.codility.com/programmers/trainings/4)
class StrSymmetryPoint {
    

    public func solution(_ S : inout String) -> Int {
        if S.count == 1 {
            return 0
        } else if S.count%2 == 0 { // 짝수 길이면 없음
            return -1
        }
        
        let index = S.count / 2
        let start = String(S.prefix(index).reversed())
        let end = String(S.suffix(index))
        
        //print(index, start, end)
        if start == end {
            return index
        } else {
            return -1
        }
    }

    var a = "racecar"
    var b = "x"
    var c = ""
    var d = "dqab"

    func test() {
        print(solution(&a))
        print(solution(&b))
        print(solution(&c))
        print(solution(&d))
    }
}
