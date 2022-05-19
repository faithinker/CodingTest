//
//  Baekjoon_11279.swift
//  CodingTest
//
//  Created by pineone on 2022/05/19.
//

import Foundation

/// 만약 x가 자연수라면 배열에 x라는 값을 넣는(추가하는) 연산이고,
/// x가 0이라면 배열에서 가장 큰 값을 출력하고 그 값을 배열에서 제거하는 경우
/// 배열이 비어 있는 경우인데 가장 큰 값을 출력하라고 한 경우에는 0출력
/// 0 1 2 0 0 3 2 1 0 0 0 0 0
/// 0 2 1 3 2 1 0 0

/// [백준 11279][실버2] 최대 힙(https://www.acmicpc.net/problem/11279)
class Baekjoon_11279 {
    
    var heap = Heap<Int>(sort: >)
    
    var result = ""
    
    init() {
        solution()
    }
    
    func solution() {
        for _ in 0..<Int(readLine()!)! {
            let num = Int(readLine()!)!
            
            if num == 0 {
                result += "\(heap.remove() ?? 0)\n"
            } else {
                heap.insert(num)
            }
        }
        result.removeLast()
        print(result)
    }
}
