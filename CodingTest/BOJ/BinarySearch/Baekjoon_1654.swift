//
//  Baekjoon_1654.swift
//  CodingTest
//
//  Created by jhkim on 2022/11/15.
//

import Foundation

/// [백준 1654][실버2] 랜선 자르기(https://www.acmicpc.net/problem/1654)

class Baekjoon_1654 {
    
    var m = ReadLine().getArrInt()
    lazy var k = ReadLine().multipleNewLine(num: m[0])
    lazy var n = m[1]
    
    init() {
        print(binarySearch(k, target: n))
    }

    //var k = [802, 743, 457, 539]
    //var n = 11

    func binarySearch(_ arr: [Int], target: Int) -> Int {
        var start = 1, end = arr.max() ?? 1
        
        while start <= end {
            let mid = (start + end) / 2
            
            let total = arr.map { $0/mid }.reduce(0, +)
            
            if total < target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return end
    }
}
