//
//  Baekjoon_9251.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/19.
//

import Foundation

/// [백준 9251][골드5] LCS(https://www.acmicpc.net/problem/9251)

/// LCS(Longest Common Subsequence) 최장 공통 부분 서열 문제
/// https://www.youtube.com/watch?v=EAXDUxVYquY
/// https://sapjilkingios.tistory.com/entry/SwiftDP-백준-9251번-LCS
/// https://melonicedlatte.com/algorithm/2018/03/15/181550.html

class Baekjoon_9251 {

    func solution(_ x: String, _ y: String) -> Int {
        
        let xx = x.map { String($0) }
        let yy = y.map { String($0) }
        
        let xc = xx.count, yc = yy.count
        
        // 0번째 가로줄과 0번째 세로줄을 순회할때 한쪽(위/왼)만 참조한다. 예외처리 하기 귀찮아서 칸을 한개 늘려준다.
        // 첫번째가 count가 세로줄, 두번째가 count가 가로줄 갯수
        var dp = Array(repeating: Array(repeating: 0, count: yc + 1), count: xc + 1)
        
        for i in 1...xc {
            for j in 1...yc {
                if xx[i - 1] == yy[j - 1] { // 같다면 대각선에서 1 증가 처리
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else { // 다르면 한쪽(위/왼) 중 최댓값
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        Helper().logMatrix(dp)
        
        return dp[xc][yc]
    }

    func call() {
        //let a = readLine()!
        //let b = readLine()!
        //
        //print(solution(a, b))

        print(solution("ACAYKP", "CAPCAKP")) // 답: 5
        print(solution("A", "B")) // 답: 0

        print(solution("AAACATCGT", "TACCTAAAA")) // 답: 4
    }
    

}
