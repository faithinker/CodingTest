//
//  Baekjoon_2252.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/03.
//

import Foundation

/// 이코테 33분 05초
/// 위상정렬 : 사이클이 없는 방향 그래프의 모든 노드를 방향성에 거스르지 않도록 순서대로 나열하는 것
///
/// 선수 개념
/// 진입차수(Indegree) : 특정 노드로 `들어오는` 간선의 개수
/// 진출차수(Outdegree) : 특정 노드에서 `나가는` 간선의 개수
///
/// 전제조건 : DAG(Directed Acyclic Graph) - 사이클이 없는 방향 그래프 이어야만 한다.
/// 구현 방법 : 큐 or DFS를 이용하여 구현
/// 1. 진입차수가 0인 모든 노드를 큐에 넣는다.
/// 2. 큐가 빌때까지 반복한다.
///     1) 큐에서 원소를 꺼내 해당 노드에서 나가는 간선을 그래프에서 제거한다.
///     2) 새롭게 진입차수가 0이 된 노드를 큐에 넣는다.

// arr[노드] = 진입차수 테이블을 만든다음 계속 0으로 만드는 갱신 작업 반복
// 0이 되면 큐에 삽입

/*
첫째 줄 노드 갯수 n, 간선 갯수 v
2번째 ~ V+1번째 : 출발 도착
7 8
1 2
1 5
2 3
2 6
3 4
4 7
5 6
6 4
Result: 1 2 5 3 6 4 7
*/

/// [백준 2252][골드3] 줄 세우기(https://www.acmicpc.net/problem/2252)
/// 위상 정렬 알고리즘
class Baekjoon_2252 {
    func solution() {
        let (v, e) = ReadLine().getTwoTupleInt()
        
        var table = Array(repeating: 0, count: v+1) // 노드와 진입차수
        
        var edges = Array(repeating: Array<Int>(), count: v+1)
        
        var queue = [Int]()
        
        for _ in 1...e {
            let (s, e) = ReadLine().getTwoTupleInt()
            edges[s].append(e)
            table[e] += 1
        }
        
        for i in 1...v where table[i] == 0 {
            queue.append(i)
        }
        
        //print("edges: \(edges)")
        //print("table: \(table)")
        var result = ""
        
        while queue.isEmpty == false {
            //print("queue: \(queue)")
            
            let now = queue.removeFirst()
            result += "\(now) "
            
            for k in edges[now] {
                table[k] -= 1
                
                if table[k] == 0 {
                    queue.append(k)
                }
            }
        }
        
        print(result)
    }
    
    func call() {
        solution()
    }
}

