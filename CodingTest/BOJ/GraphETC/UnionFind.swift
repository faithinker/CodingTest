//
//  UnionFind.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/03.
//

import Foundation

/// Union-Find = 서로소 집합
/// 서로소 집합(Disjoint Sets) : 공통 원소가 없는 두 집합
/// 같은 부모인지 판단 => 같은 집합
/// 루트 노드를 찾기 위해 부모 테이블을 계속해서 확인 => 재귀적으로 확인하고 노드 번호와 부모가 같으면 종료
/// https://www.youtube.com/watch?v=aOhhNFTIeFI

class UnionFind {
    
    /// 부모 노드의 진짜 값을 찾는 함수
    func findParent(_ parent: [Int], _ x: Int) -> Int {
        if parent[x] != x { // 루트 노드 찾을 때까지 재귀 호출
            return findParent(parent, parent[x])
        }
        return x
    }

    /// 원소 합치기, 작은 값으로 부모값을 변경
    func unionParent(_ parent: inout [Int], _ a: inout Int, _ b: inout Int) {
        a = findParent(parent, a)
        b = findParent(parent, b)
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
}
