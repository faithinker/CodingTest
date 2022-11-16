//
//  Baekjoon_10815.swift
//  CodingTest
//
//  Created by jhkim on 2022/11/15.
//

import Foundation

/// [백준 10815][실버5] 숫자카드(https://www.acmicpc.net/problem/10815)

class Baekjoon_10815 {
    var first = ReadLine().getInt()
    var firstArr = ReadLine().getArrInt()
    var second = ReadLine().getInt()
    var secondArr = ReadLine().getArrInt()

    //var firstArr = [6, 3, 2, 10, -10]
    //var secondArr = [10, 9, -5, 2, 3, 4, 5, -10]
    
    init() {
        firstArr.sort()
        secondArr.forEach {
            print(binarySearch(arr: firstArr, target: $0))
        }
    }
    
    func binarySearch(arr: [Int], target: Int) -> Int {
        var start = 0, end = arr.count-1
        
        while start <= end {
            var mid = (start + end) / 2
            
            if arr[mid] == target {
                return 1
            } else if arr[mid] < target {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        return 0
    }
    
}


