//
//  Sol_118667.swift
//  CodingTest
//
//  Created by jhKim on 2022/09/29.
//

import Foundation


/// [프로그래머스 118667] 두 큐 합 같게 만들기 실패! https://school.programmers.co.kr/learn/courses/30/lessons/118667 - 투포인터

class Sol_118667 {
    
    let queue1T1 = [3, 2, 7, 2]
    let queue2T2 = [4, 6, 5, 1] // result: 2

    let queue1T3 = [1, 2, 1, 2]
    let queue2T4 = [1, 10, 1, 2] // result: 7

    let queue1T5 = [1, 1]
    let queue2T6 = [1, 5] // result: -1
    
    
    init() {
        print(solution(queue1T1, queue2T2))
    }
    
    func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
        
        let queue = queue1 + queue2             // 두 배열을 합침
        let target = queue.reduce(0, +) / 2     // 부분합
        
        var count = 0
        var i = 0, j = queue1.count - 1         // 시작점, 끝점
        
        var q1Sum = queue1.reduce(0, +)         // 한쪽이 target과 같은값 되는지
        
        while i < queue.count && j < queue.count { // 시작점과 끝점이 전체큐의 범위내에 드는지 확인
            if q1Sum == target {
                return count
            } else if q1Sum < target && j < queue.count - 1 {
                // q1의 부분합이 타겟보다 작고, 끝점이 정상범위라면
                // 끝점을 이동시켜 부분합을 증가시킨다.
                j += 1
                q1Sum += queue[j]
            } else {
                // 반대로 q1이 크거나 끝점이 끝의 인덱스라면..
                // q1의 remove 시킴. 시작점을 한칸 이동 => 부분합이 작아진다.
                q1Sum -= queue[i]
                i += 1
            }
            count += 1
        }
        return -1
    }
}
