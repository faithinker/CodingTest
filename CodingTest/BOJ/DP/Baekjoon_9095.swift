//
//  Baekjoon_9095.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/28.
//

import Foundation

/// [백준 9095][실버3] 1, 2, 3 더하기(https://www.acmicpc.net/problem/9095)
class Baekjoon_9095 {
    
    func call() {
        let t = Int(readLine()!)!

        var arr = [Int]()

        for _ in 0..<t {
            let n = Int(readLine()!)!
            arr.append(n)
        }

        for i in arr {
            solution(i)
        }
    }

    func solution(_ n: Int) {
        
        var dp = Array(repeating: 0, count: n+3)
        dp[1] = 1; dp[2] = 2; dp[3] = 4
        
        if n < 4 {
            print(dp[n])
            return
        }
        
        for i in 4..<n+1 {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        }
        
        print(dp[n])
    }
}
