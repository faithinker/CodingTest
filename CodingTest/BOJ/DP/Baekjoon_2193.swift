//
//  Baekjoon_2193.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/18.
//

import Foundation


/// [백준 2193][실버3] 이친수(https://www.acmicpc.net/problem/2193)
/// 점화식 Xk = Xk-1 + Xk-2  단) X1 = 1, X2 = 2
/// 앞의 숫자는 10~으로 시작할 수 밖에 없다.
/// 앞의 것이 1이라면 뒤의 것은 무조건 0이 와야되고, 앞의 것이 0이라면 0, 1 두개가 다 와야한다.
class Baekjoon_2193 {
    
    func solution(_ x: Int) -> Int {
        if x < 3 { // 문제의 제한조건 N은 1이상의 자연수
            return 1
        }
        
        var dp = Array(repeating: 0, count: x)
        
        dp[0] = 1
        dp[1] = 1
        
        for i in 2..<x {
            dp[i] = dp[i-1] + dp[i-2]
        }
        
        return dp[x-1]
    }
    
    func call() {
        let x = ReadLine().getInt()
        print(solution(x))
        
        let s1 = solution(3) // 101, 100 => 2
        let s2 = solution(5)
    }
}
