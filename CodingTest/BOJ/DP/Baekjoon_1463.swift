//
//  Baekjoon_1463.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/06.
//

import Foundation

/// [백준 1463][실버3] 1로 만들기(https://www.acmicpc.net/problem/1463)

/// N을 1로 만들기 위해 필요한 최소 횟수
/// 1. N - 1을 1로 만들기 위한 최소횟수 + 1
/// 2. 2나 3으로 나누어지면, 나눠지고 남은 몫의 경우의 연산 + 1
/// 바텀업 방식으로는 구현가능하나 탑다운 형식으로는 구현 불가능
///
/// f(n) = 1 + min(f(n/3), f(n/2), f(n-1)
/// 조건만족하는 값들 중 제일 작은 값을 넣고 1을 더한다.

class Baekjoon_1463 {
    
    func call() {
        let r = ReadLine().getInt()
        print(solution(r))
        
        //print(solution(10))
    }

    func solution(_ x: Int) -> Int {
        var dp = Array(repeating: 0, count: x+1)
        
        for i in 2..<x+1 {
            dp[i] = dp[i - 1] + 1
            
            if i%2 == 0 {
                dp[i] = min(dp[i], dp[i/2] + 1)
            }
            
            if i%3 == 0 {
                dp[i] = min(dp[i], dp[i/3] + 1)
            }
        }
        
        return dp[x]
    }

}
