//
//  Baekjoon_11726.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/28.
//

import Foundation

/// [백준 11726][실버3] 2×n 타일링(https://www.acmicpc.net/problem/11726)
class Baekjoon_11726 {
    
    func call() {
        let n = Int(readLine()!)!
        
        solution(n)
    }

    func solution(_ n: Int) {
        var dp = Array(repeating: 0, count: n+2)
        dp[1] = 1; dp[2] = 2
        
        if n < 3 {
            print(dp[n])
            return
        }
        
        for i in 3...n {
            dp[i] = (dp[i-1] + dp[i-2]) % 10007
        }
        
        print(dp[n])
    }
}
