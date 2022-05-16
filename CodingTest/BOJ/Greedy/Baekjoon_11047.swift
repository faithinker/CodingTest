//
//  Baekjoon_11047.swift
//  CodingTest
//
//  Created by jhKim on 2022/05/16.
//

import Foundation

/// [백준 11047][실버3] 동전 0(https://www.acmicpc.net/problem/11047)
class Baekjoon_11047 {
    
    init() {
        let info = ReadLine().getArrInt()
        let number = ReadLine().multipleNewLine(num: info[0])

        print(solution(n: number, k: info[1]))
    }

    func solution(n: [Int], k: Int) -> Int {
        
        // 처음엔 n대신에 더미데이터로 테스트!! => 시간 단축
        //var list = [1, 5, 10, 50, 100, 500, 1000, 5000, 10000, 50000]
        var changes = k
        var result = 0
        
        for i in n.reversed() {
            result += changes/i
            changes = k%i
            
            //print(i, "| 결과:", result, "| 잔돈..",changes)
            
            if changes == 0 {
                break
            }
        }
        return result
    }


}
