//
//  Baekjoon_11404.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/30.
//

import Foundation

/// 플로이드 와샬 알고리즘 (Floyd-Warshall)  - DP, 다익스트라 알고리즘과 비교
/// 모든 노드에서 다른 모든 노느까지의 최단 경로 모두 계산
/// 거쳐가는 노드를 기준으로 알고리즘을 수행
/// 2차원 테이블에 최단 거리 정보 저장 => 점화식 계산
/// 점화식에 맞게 3중 반복문을 이용해 2차원 테이블 갱신
/// 모든 노드에서 다른 모든 노드까지의 최단 거리를 구하는 과정에서 시간 복잡도는 Ologn^3 굉장히 길다.
/// 노드의 갯수가 적은 상황에서 효과적이다. 노드와 간선의 갯수가 많다면 다익스트라 알고리즘을 고려
/// 점화식 : Dab = min(Dab, Dak + Dkb) => a에서 b로가는 최단거리 VS a에서 k를 거쳐 b로 가는 거리


/// [백준 11404][골드4] 플로이드(https://www.acmicpc.net/problem/11404)
class Baekjoon_11404 {
    let inf = Int(1e9)
    
    func solution(_ n: Int, _ m: Int, _ graphs: [[Int]]) {
        
        var graph = graphs
        
        for _ in 0..<m {
            let (a, b, c) = ReadLine().getThreeTupleInt() // 시작, 도착, 비용
            graph[a][b] = min(graph[a][b], c)
        }

        for i in 1..<n { // 자기 자신과 만나는 좌표 = 0
            graph[i][i] = 0
        }


        for k in 1..<n {
            for i in 1..<n {
                for j in 1..<n {
                    graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
                }
            }
        }

        for i in 1..<n {
            for j in 1..<n {
                print(graph[i][j] == inf ? 0 : graph[i][j], terminator: " ")
                //print(graph[i][j], terminator: " ")
            }
            print("")
        }
    }
    
    
    /*
    4
    7
    1 2 4
    1 4 6
    2 1 3
    2 3 7
    3 1 5
    3 4 4
    4 3 2
    답
    0 4 8 6
    3 0 7 9
    5 9 0 4
    7 11 2 0
    */
    
    func call() {
        let n = ReadLine().getInt() + 1, m = ReadLine().getInt() // 노드와 간선의 갯수, 1부터 n+1 까지 그래프 표기
        
        var graph: [[Int]] = Array(repeating: Array(repeating: inf, count: n), count: n)

        solution(n, m, graph)
    }
    
    func call2() {
        let n = 4, m = 7 // 노드와 간선의 갯수
        var graph = Array(repeating: Array(repeating: 9, count: n + 1), count: n + 1) //Int.max

        var grpah = [[],
                     [(2, 4), (4, 6)],
                     [(1, 3), (3, 7)],
                     [(1, 5), (4, 4)],
                     [(3, 2)]]
        
        solution(n, m, graph)
    }
    


}
