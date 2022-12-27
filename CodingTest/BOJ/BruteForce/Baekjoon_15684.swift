//
//  Baekjoon_15684.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/27.
//

import Foundation

class Baekjoon_15684 {
    
    /// [백준 15684][골드3] 사다리 조작(https://www.acmicpc.net/problem/15684)

    /// 세로선의 개수 N, 가로선의 개수 M, 세로선마다 가로선을 놓을 수 있는 위치의 개수 H
    /// 2 ≤ N ≤ 10, 1 ≤ H ≤ 30, 0 ≤ M ≤ (N-1)×H
    /// 정답이 3보다 큰 값이거나 불가능한 경우 -1 출력
    func solution(_ n: Int, _ m: Int, _ h: Int, _ arr: [Int]) -> Int {
    
        // 2차원 배열? 1차원 배열?
        var location = [Int]() // 세로, 가로
    
    
        for i in 1...m {
            location.append(0)
            location.append(i)
        }
    
        print("location: \(location)")
    
    
    
        func cycle(_ depth: Int) {
    
        }
    
    
        return -9999
    }
    
    
    func call() {
        solution(5, 5, 6, [1, 1, 3, 2, 2, 3, 5, 1, 5, 4])
    }
    
    
    //5 5 6.  세로  가로 위치의 개수
    //1 1
    //3 2
    //2 3
    //5 1
    //5 4
}
