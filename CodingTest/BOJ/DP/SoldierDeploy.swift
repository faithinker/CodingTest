//
//  SoldierDeploy.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/12.
//

import Foundation


/* DP + LIS (가장 긴 증가하는 부분 수열)
 병사 배치하기 1시간
 https://www.youtube.com/watch?v=5Lu34WIx2Us&t=1h
 */

class SoldierDeploy {
    
    // solution LIS
    func solution2(_ x: Int, arr: [Int]) -> Int {
        var list = Array(arr.reversed())
        var dp = Array(repeating: 1, count: x)
        
        for i in 1..<x {
            for j in 0..<i {
                if list[j] < list[i] { // 앞이 뒤보다 작을 경우만 점화식에 따라 갱신
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        return x - (dp.max() ?? 1)
    }

    
    
    // 내 풀이인데 틀렸을수도...
    func solution(_ x: Int, arr: [Int]) -> Int {
        var dp = Array(repeating: x, count: x)
        
        for i in 1..<x {
            if arr[i-1] < arr[i] {
                //print("dp[\(i)]:\(dp[i]) @ dp[\(i-1)]: \(dp[i-1])")
                dp[i] = dp[i-1] - 1
            } else {
                dp[i] = dp[i-1]
            }
        }
        
//        print(dp)
        return x - dp[x-1]
    }



    func call() {
//        print(solution(7, arr: [15, 11, 4, 8, 5, 2, 4]))
        
        let s2 = solution2(7, arr: [15, 11, 4, 8, 5, 2, 4])
        print(s2)
    }
}
