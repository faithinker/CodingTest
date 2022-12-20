//
//  Baekjoon_9663.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/20.
//

import Foundation

/*
 https://www.youtube.com/watch?v=ykZZbNCAEJU&list=PLBdD-Necee4nHCmsBQPMmlQz8IYn489zz
 https://www.youtube.com/watch?v=ltm-JX5R1pA
 가로 세로 대각선 겹치는 경우 조건 체크
 */

// 완전탐색 : 순열, 백트래킹(재귀), BFS
// 백트래킹 : 완전 탐색을 하는 도중, 현재 탐색이 무의미한 경우 되돌아가는 알고리즘. DFS + 가지치기
// 현재 상태에서 가능한 모든 후보군을 따라 들어가며 탐색하는 알고리즘.
// 현재 상태에서 가능한 모든 선택지를 다 해보고 안되면 후퇴


/// [백준 9663][골드4] N-Queen(https://www.acmicpc.net/problem/9663) - 실패! => 추후 다시

class Baekjoon_9663 {
    
    init() {
        print(solution(n))
    }
    
    var n = ReadLine().getInt() //4

    var vx = Array(repeating: 0, count: 15 + 1)
    var vy = Array(repeating: 0, count:15 + 1)

    func solution(_ n:Int) -> Int {
        var count = 0
        
        for i in 0..<n { // 가로줄 이동
            count += go(0, i)
        }
        
        return count
    }

    func go(_ y: Int, _ x: Int) -> Int {
        
        for i in 0..<y { // 가지치기 (BackTracking)
            if y == vy[i] { return 0 } // 가로위치 겹침
            if x == vx[i] { return 0 } // 세로위치 겹침
            if abs(x-vx[i]) == abs(y-vy[i]) { return 0 } // 대각선 겹침
        }
        
        if y == n - 1 { return 1 } // 성공
        
        vy[y] = y
        vx[y] = x
        
        var k = 0
        for i in 0..<n { // 세로줄 이동
            k += go(y + 1, i)
        }
        return k
    }
}
