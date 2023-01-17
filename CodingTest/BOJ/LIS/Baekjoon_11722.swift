//
//  Baekjoon_11722.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/17.
//

import Foundation

/// [백준 11722][실버2] 가장 긴 감소하는 부분 수열(https://www.acmicpc.net/problem/11722)
class Baekjoon_11722 {
    

    func solution(_ x: Int, arr: [Int]) -> Int {
        var list: [Int] = arr.reversed()
        var dp = Array(repeating: 1, count: x)
        
        for i in 1..<x {
            for j in 0..<i {
                if list[j] < list[i] { // 앞이 뒤보다 작을 경우만 점화식에 따라 갱신
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        return dp.max() ?? 0
    }
    
    func call() {
        
        //let x = ReadLine().getInt()
        //let list = ReadLine().getArrInt()
        //
        //print(solution(x, arr: list))
        
        let s1 = solution(6, arr: [10, 30, 10, 20, 20, 10])
        print(s1)
    }
}
