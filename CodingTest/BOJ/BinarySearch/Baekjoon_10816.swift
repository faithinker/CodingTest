//
//  Baekjoon_10816.swift
//  CodingTest
//
//  Created by jhkim on 2022/11/15.
//

import Foundation


// MARK: 특정 범위 찾는 이분 탐색. lowerbound, upperbound 공부 필요!

/// [백준 10816][실버4] 수 찾기2(https://www.acmicpc.net/problem/10816)
/// cpp & python : https://i-never-stop-study.tistory.com/54

class Baekjoon_10816 {
    
    var f = ReadLine().getInt()
    var first = ReadLine().getArrInt()
    var s = ReadLine().getInt()
    var second = ReadLine().getArrInt()

    var dic = [Int:Int]()
    
    init() {
        solution()
    }
    
    func solution() {
        first.forEach {
            dic.updateValue(1 + (dic[$0] ?? 0), forKey: $0)
        }

        var result: String = ""

        second.forEach {
            result += "\(dic[$0] ?? 0) "
        }
        
        print(result)
    }
    
}

