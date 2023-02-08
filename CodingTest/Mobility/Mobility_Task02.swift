//
//  Mobility_Task02.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/08.
//

import Foundation

class Mobility_Task02 {
    
    /// 각각의 갯수 + 가장 멀리있는 위치의 왕복거리
    /// P 플라스틱, G 유리, M 금속
    func solution(_ d: [Int], _ t: [String]) -> Int {
        var dp = Array(repeating: 0, count: d.count+1) // 거리 왕복 시간
        
        var (pCount, gCount, mCount) = (0, 0, 0)
        var (pIndex, gIndex, mIndex) = (0, 0, 0)
        
        
        for i in 1...d.count {
            dp[i] = dp[i-1] + d[i-1] * 2
        }
        
    //    print("dp: \(dp)")
        
        for i in 0..<t.count {
            for j in t[i] {
                switch String(j) {
                case "P":
                    pIndex = i + 1
                    pCount += 1
                case "G":
                    gIndex = i + 1
                    gCount += 1
                default:
                    mIndex = i + 1
                    mCount += 1
                }
            }
        }
        
    //    print(pCount, gCount, mCount)
    //    print("========= Index ========")
    //    print(pIndex, gIndex, mIndex)
        
        let result = max(pCount + dp[pIndex], gCount + dp[gIndex], mCount + dp[mIndex])
        
        return result
    }

    
    func call() {
        let s1 = solution([2, 5], ["PGP", "M"]) // 15
        let s2 = solution([3, 2, 4], ["MPM", "", "G"]) // 19
        let s3 = solution([2, 1, 1, 1, 2], ["", "PP", "PP", "GM", ""]) // 12
        
        print(s1)
        print(s2)
        print(s3)
    }
}
