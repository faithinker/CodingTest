//
//  Baekjoon_11054.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/13.
//

import Foundation

/// [백준 16236][골드4] 가장 긴 바이토닉 부분 수열(https://www.acmicpc.net/problem/11054)

class Baekjoon_11054 {
    
    func solution(_ x: Int, arr: [Int]) -> Int {
        var list = Array(arr.reversed())
        
        var dp1 = Array(repeating: 1, count: x)
        var dp2 = Array(repeating: 0, count: x)
        var result = Array(repeating: 0, count: x)
        
        for i in 0..<x {
            for j in 0..<i {
                if arr[j] < arr[i] { // 앞이 뒤보다 작을 경우만 점화식에 따라 갱신
                    dp1[i] = max(dp1[i], dp1[j] + 1)
                }
                
                if list[j] < list[i] {
                    dp2[i] = max(dp2[i], dp2[j] + 1)
                }
            }
        }
        
        for i in 0..<dp1.count {
            result[i] = dp1[i] + dp2[dp2.count - i - 1]
        }
        
        return result.max() ?? 0
    }

    func call() {
        //let x = ReadLine().getInt()
        //let arr = ReadLine().getArrInt()
        //
        //print(solution(x, arr: arr))

        let s1 = solution(10, arr: [1, 5, 2, 1, 4, 3, 4, 5, 2, 1]) // [1, 2, 3, 4, 5, 2, 1] =>  7
        print(s1)
    }

}
