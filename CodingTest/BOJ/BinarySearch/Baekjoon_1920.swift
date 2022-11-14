//
//  Baekjoon_1920.swift
//  CodingTest
//
//  Created by jhkim on 2022/11/14.
//

import Foundation

/// [백준 1920][실버4] 수 찾기(https://www.acmicpc.net/problem/1920)

class Baekjoon_1920 {
    var n = [4, 1, 5, 2, 3]
    var m = [1, 3, 7, 9, 5]
    
    //var nn = ReadLine().getInt()
    //var n = ReadLine().getArrInt()
    //
    //var mm = ReadLine().getInt()
    //var m = ReadLine().getArrInt()
    
    init() {
        n.sort(by: <)
        
        for target in m {
            print(binarySearch(target, 0, n.count-1))
        }
    }
    
    func binarySearch(_ target: Int, _ start: Int, _ end: Int) -> Int {
        let mid = (start + end) / 2
        
        if start > end {
            return 0
        }
        
        if n[mid] == target {
            return 1
        } else if n[mid] > target {
            return binarySearch(target, start, mid-1)
        } else {
            return binarySearch(target, mid+1, end)
        }
    }
    
    
    // 비슷한 원리?인데 답은 틀렸다고 함
    //for i in m {
    //
    //    //print("target: \(i)")
    //
    //    var start = 0, end = n.count - 1
    //
    //    if i < n[start] || i > n[end] {
    //        print("0")
    //    } else {
    //        while start <= end {
    //            //print("start: \(start) @@ end: \(end)")
    //
    //            var mid = (start + end) / 2
    //            //print("mid: \(mid) @@ i: \(i)")
    //
    //            if i == n[mid] {
    //                print("1")
    //                break
    //            } else if i < n[mid] {
    //                end = mid - 1
    //                //print("종점 변경 start: \(start) @@ end: \(end)")
    //            } else if i > n[mid] {
    //                start = mid + 1
    //                //print("시점 변경 start: \(start) @@ end: \(end)")
    //            }
    //        }
    //    }
    //}
}
