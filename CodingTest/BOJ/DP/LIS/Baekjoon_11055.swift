//
//  Baekjoon_11055.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/13.
//

import Foundation

/// [백준 11055][실버2] 가장 큰 증가 부분 수열(https://www.acmicpc.net/problem/11055)
class Baekjoon_11055 {
    
    func call() {
        //let x = ReadLine().getInt()
        //let arr = ReadLine().getArrInt()
        //print(solution(x, arr: arr))
        //print(arr)

        //solution(10, arr: [1, 100, 2, 50, 60, 3, 5, 6, 7, 8])
        //solution(10, arr: [102, 100, 2, 3, 4, 3, 5, 6, 7, 8])
        //solution(5, arr: [1, 8, 2, 3, 9])
        let s1 = solution(9, arr: [10, 2, 9, 1, 2, 3, 4, 7, 6])
        print(s1)
    }

    func solution(_ x: Int, arr: [Int]) -> Int {
        var dp = arr, result = 0
        
        for i in 0..<x {
            for j in 0..<i {
                if arr[j] < arr[i] { // 같은 숫자라도 최대 누적합과 현재 값을 더한다.
                    dp[i] = max(dp[i], dp[j] + arr[i])
                }
            }
            result = max(result, dp[i])
        }
        
        return result
    }
}
