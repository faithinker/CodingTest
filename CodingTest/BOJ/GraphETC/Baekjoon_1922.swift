//
//  Baekjoon_1922.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/03.
//

import Foundation

/// [백준 1922][골드4] 네트워크 연결(https://www.acmicpc.net/problem/1922)
/// 크루스칼 알고리즘
class Baekjoon_1922 {
    
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
    
    func call() {
        let v = ReadLine().getInt()
        let e = ReadLine().getInt()

        solution(v, e)
    }
}
