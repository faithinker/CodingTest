//
//  Sol_86491.swift
//  CodingTest
//
//  Created by pineone on 2021/10/09.
//

import Foundation

/// [프로그래머스 86491] 최소직사각형(https://programmers.co.kr/learn/courses/30/lessons/86491)
class Sol_86491: Log {
    
    override init() {
        super.init()
        LOG(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))
    }
    
    func solution(_ sizes:[[Int]]) -> Int {
        var left = [Int]()      // 최댓값의 모음
        var right = [Int]()     // 최솟값의 모음

        sizes.forEach {
            left.append($0.max()!)
            right.append($0.min()!)
        }
        
        return left.max()! *  right.max()!
    }
}


//solution([[60, 50], [30, 70], [60, 30], [80, 40]])
//LOG(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))
//print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))
//print(solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]]))
//print(solution([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]))

// 큰 길이를 한쪽으로 몰아서 넣자...!
// 각 일차원 배열을 비교해서 => 큰쪽을 왼쪽으로 밀어넣자...
// 예외 케이스 같을때...?


// 다른 사람의 풀이법..
//func solution(_ sizes:[[Int]]) -> Int {
//    var maxNum = 0
//    var minNum = 0
//
//    for size in sizes {
//        maxNum = max(maxNum, size.max()!)
//        minNum = max(minNum, size.min()!)
//    }
//    return maxNum * minNum
//}

// 나의 경우는 배열에 담아두기 위해 대소 비교를 한번 더 하기 때문에 효율이 안좋다...
// 바로 배열에 담지 않고 Int 변수 대소 비교하는게 더 좋은 방식인 것 같다.
