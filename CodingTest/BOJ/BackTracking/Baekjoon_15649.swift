//
//  Baekjoon_15649.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/20.
//

import Foundation

/// [백준 15649][실버3] N과 M(https://www.acmicpc.net/problem/15649) - 실패! => 추후 다시
/// 1부터 N까지 중복 없이 M개를 고른 수열

class Baekjoon_15649 {
    
    init() {
        let input = ReadLine().getArrInt()
        n = input[0]
        m = input[1]
        recur()
    }
    
    var n: Int, m: Int
    var arr = [Int]()

    func recur() {
        if arr.count == m {
            let result = arr.map{ String($0) }.joined(separator:" ")
            print(result)
            return
        }
        
        for i in 1...n {
            if !arr.contains(i) {
                arr.append(i)
                recur()
                _ = arr.popLast()
            }
        }
    }
}
