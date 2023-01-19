//
//  Baekjoon_11053.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/12.
//

import Foundation

/// [백준 11053][실버2] 가장 긴 증가하는 부분 수열(https://www.acmicpc.net/problem/11053)

class Baekjoon_11053 {

    func solution(_ x: Int, _ arr: [Int]) -> Int {
        var dp = Array(repeating: 1, count: x)
        
        for i in 1..<x {
            for j in 0..<i {
                if arr[j] < arr[i] { // 앞이 뒤보다 작을 경우만 점화식에 따라 갱신
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            //print("\(i)번째 :", dp)
        }
        return dp.max() ?? 0
    }
    
    func call() {
        print(solution(6, [10, 20, 10, 30, 20, 50]))

//        let n = ReadLine().getInt()
//        let arr = ReadLine().getArrInt()
//
//        print(solution(n, arr))
    }
}
