//
//  Baekjoon_2294.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/06.
//

import Foundation

/// [백준 2294][골드4] 동전 2(https://www.acmicpc.net/problem/2294)

/// 답
/// https://www.acmicpc.net/source/53465228
/// https://landlordgang.tistory.com/131


/*
 1회차 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
 5회차 = [0, 1, 2, 3, 4, 1, 2, 3, 4, 5, 2, 3, 4, 5, 6, 3]
 12회차 = [0, 1, 2, 3, 4, 1, 2, 3, 4, 5, 2, 3, 1, 2, 3, 3]
 
 문제에서 주어진 조건도 체크하자...
 */


class Baekjoon_2294 {

    func solution(_ coins: [Int], _ x: Int) -> Int {
        var dp = Array(repeating: 10001, count: x + 1)
        
        dp[0] = 0
        
        for coin in coins { // 코인의 종류만큼 돌린다.
            if coin > x { continue } // 코인이 타겟보다 크면 for문 스킵
            for j in coin..<x+1 { // 코인 회차를 돈다.
                dp[j] = min(dp[j], dp[j - coin] + 1)
            }
            //print("\(coin)회차 = \(dp)")
        }
        //print("dp[j]: \(dp[x])")

        return dp[x] == 10001 ? -1 : dp[x]
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
        print(solution([1, 5, 12], 15))

        //print(solution([1, 5], 14))
    }
    
}
