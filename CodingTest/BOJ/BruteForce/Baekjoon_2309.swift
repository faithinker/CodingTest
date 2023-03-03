//
//  Baekjoon_2309.swift
//  CodingTest
//
//  Created by jhkim on 2023/03/02.
//

import Foundation

/// [백준 2309][브론즈1] 일곱 난쟁이(https://www.acmicpc.net/problem/2309)
/// 1. 순열  2. 이중 for문 완전탐색
class Baekjoon_2309 {
    
    func solution() {
        var arr = [Int]()

        for _ in 0..<9 {
            arr.append(Int(readLine()!)!)
        }

        var stop = false // 답이 나오면 멈출 트리거 역할
        
        // 조합으로 뽑는다. 순서를 고려하지 않는다.
        func cycle(_ index: Int, _ list: [Int]) {
            if stop {
                return
            }
            
            if list.count == 7 {
                let sum = list.reduce(0, +)

                if sum == 100 {
                    for v in list.sorted() {
                        print(v)
                    }
                    stop = true
                    return
                }
            }

            for i in index..<arr.count {
                cycle(i+1, list + [arr[i]])
            }
        }


        cycle(0, [])
    }
}

