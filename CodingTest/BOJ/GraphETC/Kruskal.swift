//
//  Kruskal.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/03.
//

import Foundation



/// MST(Minimum Spanning Tree) - 신장트리, 최소 스패닝 트리
/// 신장트리 : 그래프에서 모든 노드를 포함하면서 사이클이 존재하지 않는 부분 그래프
/// => 모든 노드 포함(연결), 사이클 X
///
/// 최소 신장 트리 = 가중치의 합이 최소가 되는 신장 트리 = 크루스칼/프림 알고리즘
/// 동작과정
/// 1. 간선 데이터를 비용에 따라 오름차순 정렬 => 비용 적은 순으로 처리
/// 2. 간선을 하나씩 확인하며 현재의 간선이 사이클을 발생시키는지 확인
///     1) 사이클 발생 X, 최소 신장 트리에 포함
///     2) 사이클 발생 O, 최소 신장 트리에 불포함
/// * 사이클 발생 여부는 Union-Find 알고리즘을 사용한다.
/// https://babbab2.tistory.com/111

/// UnionFind도 같이 공부
class Kruskal {
    
    func solution(_ v: Int, _ e: Int) { /// 크루스칼 알고리즘
        
        var result = 0
        var parent = Array(repeating: 0, count: v + 1) // 0번방 안씀
        var edges = [(Int, Int, Int)]() // 비용, 노드, 노드
        
        for i in 1...v { // 자기자신 할당
            parent[i] = i
        }
        
        for _ in 0..<e {
            let (a, b, cost) = ReadLine().getThreeTupleInt()
            edges.append((cost, a, b))
        }
        
        edges.sort { $0.0 < $1.0 } // 오름차순 정렬
        //print("sort edges: \(edges)")
        
        for (cost, aa, bb) in edges {
            var a = aa, b = bb
            let uf = UnionFind()
            
            // 사이클 아닌 경우만 집합 포함
            if uf.findParent(parent, a) != uf.findParent(parent, b) {
                uf.unionParent(&parent, &a, &b)
                result += cost
            }
        }
        
        print(result)
    }
    
    /*
    노드 갯수, 간선 갯수
    연결된 노드 및 가중치
    7 9
    1 2 29
    1 5 75
    2 3 35
    2 6 34
    3 4 7
    4 6 23
    4 7 13
    5 6 53
    6 7 25
     Result: 7 + 13 + 23 + 29 + 34 + 53 = 159  답: 28분 25초
     */
    func call2() {
        let (v, e) = ReadLine().getTwoTupleInt()

        solution(v, e)
    }
    
    
    
    /*
     1번째 입력 노드갯수v, 집합 갯수e
     2번째 줄 ~ e-1 => 각각의 집합
     6 4
     1 4
     2 3
     2 4
     5 6
     */
    
    func call() { // 16분 25초 서로소 집합을 활용한 사이클 판별
        let uf = UnionFind()
        
        let (v, e) = ReadLine().getTwoTupleInt()
        
        var parent = Array(repeating: 0, count: v + 1) // 0번방 안씀
        
        for i in 1...v { // 부모를 자기 자신으로 초기화
            parent[i] = i
        }
        
        var graph: [[Int]] = Array(repeating: Array<Int>(), count: v+1)
        
        for _ in 0..<e {
            var (a, b) = ReadLine().getTwoTupleInt()
            uf.unionParent(&parent, &a, &b)
        }
        
        print("각 원소가 속한 집합: ",terminator: "")
        for i in 1...v {
            print(uf.findParent(parent, i), terminator: " ")
            graph[uf.findParent(parent, i)].append(i)
        }
        print("")
        print("grpah: \(graph)")
        
        print("부모 테이블: ",terminator: "")
        for i in 1...v {
            print(parent[i], terminator: " ")
        }
        print("")
    }
}
