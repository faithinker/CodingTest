//
//  Baekjoon_2512.swift
//  CodingTest
//
//  Created by jhkim on 2022/11/15.
//

import Foundation

/// [백준 2512][실버3] 예산(https://www.acmicpc.net/problem/2512)
///
class Baekjoon_2512 {
    
    //var n = 4
    //var arr = [120, 110, 140, 150]
    //var target = 485

    var arr = [70, 80, 30, 40, 100]
    var target = 450

//    var n = ReadLine().getInt()
//    var arr = ReadLine().getArrInt()
//    var target = ReadLine().getInt()

    init() {
        print(binarySearch(arr: arr, maxbudget: target))
    }
    
    
    func binarySearch(arr: [Int], maxbudget: Int) -> Int {
        var start = maxbudget/arr.count, end = arr.max() ?? 1
        
        while start <= end {
            let mid = (start + end) / 2
            
            let result = arr.map {
                if $0 > mid {
                    return mid
                } else {
                    return $0
                }
            }.reduce(0, +)
            
            if result > maxbudget {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return end
    }
}
