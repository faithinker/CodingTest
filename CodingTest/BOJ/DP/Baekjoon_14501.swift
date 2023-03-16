//
//  Baekjoon_14501.swift
//  CodingTest
//
//  Created by jhkim on 2023/03/16.
//

import Foundation

/// [백준 14501][실버3] 퇴사(https://www.acmicpc.net/problem/14501)
class Baekjoon_14501 {
    
    func call() {
        let n = Int(readLine()!)!
        var tp = [[Int]]()


        for _ in 0..<n {
            tp.append(readLine()!.split(separator: " ").map { Int($0)! })
        }

        // 일자별 최대 상담할 수 있는 값
        var dp = Array(repeating: 0,count: n+10)

        for i in 0..<n {
            if dp[i] > dp[i+1] {
                //print("\(i): \(dp[i]) > \(dp[i+1])")
                dp[i+1] = dp[i]
            }

            if dp[i+tp[i][0]] < dp[i] + tp[i][1] { // dp[미래값] < 현재 + p[i]값
                //print("\(i) \(tp[i][0]): dp[\(i+tp[i][0])] ===> \(dp[i+tp[i][0]]) < \(dp[i] + tp[i][1])")
                dp[i+tp[i][0]] = dp[i] + tp[i][1]
            }
        }


        print(dp)
        print(dp[n])
    }
    
}
