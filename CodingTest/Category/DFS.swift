//
//  DFS.swift
//  CodingTest
//
//  Created by jhkim on 2022/10/25.
//

import Foundation

class DFS {
    
    // 유클리드 호제법 => 최대공약수 구하기
    func GCD(a: Int, b: Int) -> Int {
        let remainder = a % b
        //print("a:\(a), b:\(b) @@@ remainder: \(remainder)")
        if remainder == 0 {
            return b
        } else {
            return GCD(a: b, b: remainder)
        }
    }
    
    
    func onlineTest() {
        let graph = [
            [], // 0
            [2,3], // 1
            [1,4,5], // 2
            [1,6,7], // 3
            [2], // 4
            [2], // 5
            [3], // 6
            [3,8], // 7
            [7] // 8
        ]
        
        var visited = Array.init(repeating: false, count: graph.count)
        
        func dfs(start: Int) {
            visited[start] = true
            print(start, terminator: " ")
            
            for i in graph[start] {
                if visited[i] == false { // 방문하지 않았다면 재귀함수 호출
                    dfs(start: i)
                }
            }
        }
        
        dfs(start: 1)
    }
}
