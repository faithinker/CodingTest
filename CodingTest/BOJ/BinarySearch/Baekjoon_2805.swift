//
//  Baekjoon_2805.swift
//  CodingTest
//
//  Created by jhkim on 2022/11/14.
//

import Foundation

/// [백준 2805][실버4] 수 찾기(https://www.acmicpc.net/problem/2805)

class Baekjoon_2805 {
    
    init() {
        var nn = ReadLine().getArrInt()
        var data = ReadLine().getArrInt()
        var length = nn[1]

        var result = 0, start = 0, end = data.max() ?? 0

        while start <= end {
            //print("start: \(start) @@ end: \(end)")
            
            var total = 0
            var mid = (start + end) / 2
            
            for x in data {
                if x > mid { //떡이 자르는 값보다 작으면 음수값 나오기 때문에 방지 차원에서...
                    total += x - mid
                }
            }
            
            //print("total: \(total) @@ mid: \(mid)")
            
            if total < length {
                end = mid - 1
            } else {
                result = mid
                start = mid + 1
            }
        }

        print(result)
    }
    
}
