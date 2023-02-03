//
//  FutureCity.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/03.
//

import Foundation

/*
 FutureCity : 최소 시간, 1:01:15
A는 현재 1번 위치, 양방향 이동 가능
최종 목적지 X, 중간 목적지 K

첫째줄 회사갯수 경로갯수 n, m
마지막줄 최종 목적지, 중간 목적지 x, k
5 7
1 2
1 3
1 4
2 4
3 4
3 5
4 5
4 5
Result: 3  과정 1 -> 3 -> 5 -> 4
 */
class FutureCity {
    let inf = Int(1e9) // 무한을 의미하는 값으로 10억 설정
    
    func call() {
        let (n, m) = ReadLine().getTwoTupleInt()
        
        // 방 크기를 1개 크게 만들어 0번방은 사용하지 않고 index 1~N개까지의 회사를 위치시킨다.
        var graph = Array(repeating: Array(repeating: inf, count: n + 1), count: n + 1)

        var (x, k): (Int, Int) = (0, 0)

        for i in 0..<m+1 {
            let (s, e) = ReadLine().getTwoTupleInt()
            
            if i == m {
                (x, k) = (s, e)
            } else {
                graph[s][e] = 1
                graph[e][s] = 1
            }
        }

        print("n: \(n), m: \(m), x: \(x), k: \(k)")
        
        solution(n, x, k, graph)
    }
    
    /// 1->K까지 가는 최단경로 + K->X로 가는 최단 경로
    /// n 회사갯수, x 최종 목적지, k 중간목적지
    func solution(_ n: Int, _ x: Int, _ k: Int, _ graphs: [[Int]]) {
        var graph = graphs
        
        for i in 1...n { // 자기 자신과 만나는 좌표 = 0
            graph[i][i] = 0
        }
        
        for k in 1...n { // 점화식에 따라 플로이드 와샬 알고리즘 수행
            for i in 1...n {
                for j in 1...n {
                    graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
                }
            }
        }
        
        //Helper().logMatrix(graph)
        
        // 이 방 번호에 최소값이 전부 담긴거라고 보는게 맞나...?
        var distance = graph[1][k] + graph[k][x]
        
        print(distance >= inf ? -1 : distance)
    }

}
