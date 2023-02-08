//
//  Mobility_Task01.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/08.
//

import Foundation

class Mobility_Task01 {

func solution(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int {
    
    let array = [a, b, c, d]
    
    var result = [[Int]]()
    
    var visited = Array(repeating: false, count: 4)
    
    func cycle(_ now: [Int]) {
        if now.count == 4 {
            result.append(now)
            return
        }
        
        for i in 0..<4 {
            if visited[i] { // 방문한것 순회 X
                continue
            } else if now.count == 0 && array[i] > 2 { // 1000의 자리 3 미만
                continue
            } else if now.count == 1 && now[0] == 2 && array[i] > 3 { // 1000의 자리가 2일 경우 100의 자리는 4 미만
                continue
            } else if now.count == 2 && array[i] > 6 { // 10의 자리는 7 미만
                continue
            } else {
                visited[i] = true
                cycle(now + [array[i]])
                visited[i] = false
            }
        }
    }
    
    cycle([])
    
    result = result.uniqued() // 중복 제거
    
    //print("result Count: \(result.count)")
    //print(result)
    
    return result.count
}


func call() {
    /// 순열 + 커스텀 조건
    /// 4*3*2*1 = 24 -> 22 -> 10 -> 6

    let s1 = solution(1, 8, 3, 2) // 6
    let s2 = solution(2, 3, 3, 2) // 3
    let s3 = solution(6, 2, 4, 7) // 0

    print(s1)
    print(s2)
    print(s3)
}
}
