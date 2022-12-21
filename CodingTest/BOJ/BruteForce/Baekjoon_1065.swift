//
//  Baekjoon_1065.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/21.
//

import Foundation

/// [백준 1065][실버2] 스타트와 링크(https://www.acmicpc.net/problem/14889) - 이차원배열, 조합 순서X

class Baekjoon_1065 {

    init() {
        
        let s1 = ReadLine().getInt()
        let s2 = ReadLine().matrixInt(s1)
        print(solution(s2))
        
        //solution([[0, 1, 2, 3], [4, 0, 5, 6], [7, 1, 0, 2], [3, 4, 5, 0]])
        //solution([[0, 1, 2, 3, 4, 5], [1, 0, 2, 3, 4, 5], [1, 2, 0, 3, 4, 5],
        //          [1, 2, 3, 0, 4, 5], [1, 2, 3, 4, 0, 5], [1, 2, 3, 4, 5, 0]])
    }
    
    func solution(_ mat: [[Int]]) -> Int {
        
        let len = mat[0].count
        let arr = Array(0..<len)
        var minValue = Int.max
        
        func cycle(_ index: Int, _ now: [Int]) {
            if now.count == len/2 && now[0] == arr[0] { //&& now[0] == arr[0]
                
                let rival = arr.subtract(now)
                var score1 = 0, score2 = 0
                
                for i in now {
                    for j in now {
                        if i == j {
                            continue
                        }
                        score1 += mat[i][j]
                    }
                }
                
                for i in rival {
                    for j in rival {
                        if i == j {
                            continue
                        }
                        score2 += mat[i][j]
                    }
                }
                
                let diff = abs(score1 - score2)
                minValue = min(minValue, diff)
                
                return
            }
            
            for i in index..<len {
                cycle(i + 1, now + [arr[i]])
            }
        }
        
        cycle(0, [])
        
        return minValue
    }


}
