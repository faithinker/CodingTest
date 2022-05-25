//
//  Baekjoon_1110.swift
//  CodingTest
//
//  Created by pineone on 2022/05/25.
//

import Foundation

/// [백준 1110][브론즈1] 더하기 사이클(https://www.acmicpc.net/problem/1110)
class Baekjoon_1110 {
    
    init() {
        let n = Int(readLine()!)!
        print(solution(n: n))
    }
    
    func solution(n: Int) -> Int {
        var cycle = 0

        var num = n

        /// 처음에는 무조건 같기 때문에 무조건 한번 선수행한다.
        repeat {
            /// num/10 + num%10 = 각 자리의 숫자를 더한 값 => 합 % 10 => 합의 가장 오른쪽 자리수
            /// num%10 * 10 = 주어진 수의 가장 오른쪽 자리 수
            num = num%10 * 10 + (num/10 + num%10) % 10
            cycle += 1
            //print("New: ", num)
        } while num != n

        return cycle
    }
}
