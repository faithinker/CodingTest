//
//  Baekjoon_2293.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/06.
//

import Foundation

/// [백준 2293][골드4] 동전 1(https://www.acmicpc.net/problem/2293)
/// https://www.youtube.com/watch?v=2IkdAk1Loek
/// https://www.acmicpc.net/source/51806526

/* 이해를 하는게 너무 중요한 문제...
        1  2  3  4  5  6  7  8  9  10
 1      1  1  1  1  1  1  1  1  1   1
 2      0  1  1  2  2  3  3  4  4   5
 5      0  0  0  0  1  1  2  2  3   4
 누적합      2  2  3  4  5  5  7  8  10
 
 
 코인이 동전의 합보다 클수도 있다!!!
 */

class Baekjoon_2293 {
    
    func solution(_ coins: [Int], _ x: Int) -> Int {
        var dp = Array(repeating: 0, count: x + 1)
        dp[0] = 1
        
        for coin in coins { // 코인의 종류만큼 돌린다.
            if coin > x { continue } // 코인이 타겟보다 크면 for문 스킵
            for j in coin..<x+1 { // 코인 회차를 돈다.
                if dp[j] + dp[j - coin] >= Int(pow(2.0, 31.0)) { dp[j] = 0 }
                dp[j] += dp[j - coin]
            }
        }
        
        return dp[x]
    }

    
    func call() {
        let r = ReadLine().getArrInt()
        var arr = [Int]()
        for _ in 0..<r[0] {
            arr.append(ReadLine().getInt())
        }

        print(solution(arr, r[1]))
        
    }
    
    func call2() {
        print(solution([1, 2, 5], 10))
    }
}
