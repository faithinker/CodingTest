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

        let sum = arr.reduce(0, +) - 100

        var stopTrigger = false

        var (a, b) = (0, 0)

        for i in 0..<arr.count-1 {
            for j in i+1..<arr.count {
                if sum == arr[i] + arr[j] {
                    (a, b) = (arr[i], arr[j])
                    stopTrigger = true
                    break
                }
            }
            if stopTrigger {
                break
            }
        }

        arr.remove(at: arr.firstIndex(of: a)!)
        arr.remove(at: arr.firstIndex(of: b)!)


        for v in arr.sorted() {
            print(v)
        }
    }
}

