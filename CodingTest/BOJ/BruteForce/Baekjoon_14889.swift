//
//  Baekjoon_14889.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/21.
//

import Foundation

/// [백준 14889][실버2] 스타트와 링크(https://www.acmicpc.net/problem/14889) - 이차원배열, 조합 순서X

class Baekjoon_14889 {

    init() {
        
//        let s1 = ReadLine().getInt()
//        let s2 = ReadLine().matrixInt(s1)
//        print(solution(s2))
        
        let s1 = solution([[0, 1, 2, 3], [4, 0, 5, 6], [7, 1, 0, 2], [3, 4, 5, 0]])
        
//        solution([[0, 1, 2, 3, 4, 5], [1, 0, 2, 3, 4, 5], [1, 2, 0, 3, 4, 5],
//                  [1, 2, 3, 0, 4, 5], [1, 2, 3, 4, 0, 5], [1, 2, 3, 4, 5, 0]])
    }
    
    func solution(_ mat: [[Int]]) -> Int {
        let len = mat[0].count
        let arr = Array(0..<len)
        var minValue = Int.max
        
        func cycle(_ index: Int, _ now: [Int]) {
            
            if let value = now.first { // 중복 방지, cycle절반만 수행
                if value == arr[0] {
                    return
                }
            }
            
            if now.count == len/2  { // 팀이 절반으로 나뉘면 A팀 B팀 능력치의 차이 구함
                let rival = arr.subtract(now)
                let diff = abs(matrixSum(now) - matrixSum(rival))
                minValue = min(minValue, diff)
                return
            }
            
            for i in index..<len {
                cycle(i + 1, now + [arr[i]])
            }
        }
        
        func matrixSum(_ arr: [Int]) -> Int { // 행렬 누적합
            var sum = 0
            for i in arr {
                for j in arr {
                    if i == j {
                        continue
                    }
                    sum += mat[i][j]
                }
            }
            return sum
        }
        
        cycle(0, [])
        
        return minValue
    }


}
