//
//  AntWarrior.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/12.
//

import Foundation


/*
 i-1번째를 공격하면 현재(i)번째 식량창고 털 수 없음
 i-2번째를 공격하면 현재(i)번째 식량창고를 털 수 있음
 최대값 비교
 
 0 ~ i-3번째까지는 고려할 필요가 없음
 점화식을 잘 만들자...
 
 */


class AntWarrior {
    
    func solution(_ n: Int, _ arr: [Int]) -> Int {
        var dp = Array(repeating: 0, count: 200)
        
        dp[0] = arr[0]
        dp[1] = max(arr[0], arr[1])
        
        for i in 2..<n {
            dp[i] =  max(arr[i-1], arr[i-2] + arr[i])
        }
        
        return dp[n - 1]
    }

    func call() {
        let s1 = solution(4, [1, 3, 1, 5])
        print(s1)
    }
    
    
}
