//
//  Baekjoon_1753.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/30.
//

import Foundation

/// https://www.acmicpc.net/source/45586793
/// https://velog.io/@j_aion/백준-1753-최단경로-1necoeyq



/// https://youtu.be/acqm9mM1P6o
/// https://babbab2.tistory.com/110
/// https://github.com/sossam/SwiftDijkstra/blob/main/Dijkstra/main.swift
/// 0분 기본 다익스트라 (노드의 갯수가 5,000개 이하일 경우)
/// 22분 50초 우선순위 큐 + 힙 => 시간복잡도 고려하여 이걸 사용
///
///
/// Shortest Path : 가장 짧은 경로를 찾는 알고리즘
/// 다익스트라 최단 경로 : 특정 노드에서 출발해 다른 모든 노드로 가는 최단 경로 계산
/// - 음의 간선이 없을 때 정상 동작,
/// 그리디 알고리즘, DP로 분류된다. 매 상황에서 자장 비용이 적은 노드를 선택해서 반복한다.
///
/// 다익스트라 최단 경로 알고리즘 동작 과정
/// 1. 출발 노드 설정
/// 2. 최단 거리 테이블 초기화, 단 테이블의 방에 값은 무한으로 설정하고 자기자신에 대한 노드는 0으로 설정
/// 3. 방문X 노드 중에서 최단 거리가 가장 짧은 노드 선택 => 그리디 알고리즘, DP
/// 4. 해당 노드르 거쳐 다른 노드로 가능 비용을 계산하여 최단 거리 테이블 갱신
/// 5. 3~4번 반복
/// 기본 다익스트라 https://eunjin3786.tistory.com/13




/// 우선순위 큐 Priority Queue
/// 우선순위가 가장 높은 데이터를 가장 먼저 삭제하는 자료구조
/// 최소 힙 : 가장 낮은 데이터부터 추출
/// 최대 힙 : 가장 높은 데이터부터 추출
/// 다익스트라 우선순위 큐 - 방문하지 않은 노드 중에서 최단 거리가 가장 짧은 노드를 선택하기 위해 힙 자료구조 이용
/// 우선순위 큐 : (거리, 노드) => 거리가 작은 노드가 앞으로 오도록 구성된다.
/// 방문테이블 만들지 않는다?
/// 다익스트라 + 우선순위 큐
/// https://www.acmicpc.net/source/45586793
/// https://velog.io/@j_aion/백준-1753-최단경로-1necoeyq
///


// TODO: 기본 다익스트라 구현, 우선순위 큐를 이용한 구현 => 두가지 해보기

/// [백준 1753][골드4] 최단경로(https://www.acmicpc.net/problem/1753)
class Baekjoon_1753 {
    var n = 0
    var graph = [[(Int, Int)]]()
    
    
    func call() {
        let input = ReadLine().getArrInt()
        let n = input[0], m = input[1]
        let start = ReadLine().getInt()
        var graph = Array(repeating: Array<(Int, Int)>(), count: n + 1) // 0번 x. 1번부터 시작

        print("graph: \(graph)")

        for _ in 0..<n + 1 {
            /// a: 출발지, b: 도착지, c: 가중치
            let (a, b, c) = ReadLine().getThreeTupleInt()
            graph[a].append((b, c))
        }

        print("graph2: \(graph)")
        
        self.n = n
        self.graph = graph
        
        dijkstra(start)
    }

    func sample() { // Sample Data
        let n = 5, m = 6
        let start = 1
        var graph = [[],
                     [(2, 2), (3, 3)],
                     [(3, 4), (4, 5)],
                     [(4, 6)],
                     [],
                     [(1, 1)]]
        
        dijkstra(start)
    }


    

    func dijkstra(_ start: Int) {
        var distance = Array(repeating: Int.max, count: n + 1)
        distance[start] = 0 // 출발지 거리 = 0
        
        var pq = PriorityQueue<(Int, Int)>(sort: { $0.0 < $1.0 }) //(거리, 노드)
        pq.enqueue((0, start))
        
        while pq.isEmpty == false { // 우선순위 큐가 빌때까지 수행
            let (curCost, curNode) = pq.dequeue()!
            
            if distance[curNode] < curCost { continue } // 이미 처리된 적 있는 노드라면 Skip
            
            for n in graph[curNode] {
                let (nextNode, nextCost) = (n.0, n.1)
                let sum = nextCost + curCost
                if distance[nextNode] > sum { // 기존값 > 현재값 + 가중치
                    distance[nextNode] = sum
                    pq.enqueue((sum, nextNode))
                }
            }
        }
        
        for i in 1..<distance.count {
            _ = distance[i] == Int.max ? print("INF") : print(distance[i])
        }
    }
}
