//
//  Baekjoon_2667.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/27.
//

import Foundation

/// [백준 2667][실버 1] 단지번호붙이기(https://www.acmicpc.net/problem/2667)
/// 이코테 DFS & BFS : https://www.youtube.com/watch?v=7C9RgOcvkvo

class Baekjoon_2667 {
    
    /// 각 간선의 비용이 동일한 상황에서 최단거리 문제를 해결하기 위해 사용
    /// BFS 구현 : 큐 + while문(큐가 빌 때까지 수행)
    func solution1(_ n: Int, _ arr: [[Int]]) {
        
        // 그래프, 결과 배열, 단지 갯수
        var graph = arr, result = [Int](), resultCount = 0
        let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
        
        func bfs(_ x: Int, _ y: Int) -> Int {
            var queue: [(Int, Int)] = [(x, y)]
            var count = 1
            graph[x][y] = 0
            
            while !queue.isEmpty {
                let temp = queue.removeFirst()
                for i in 0..<4 {
                    let nx = temp.0 + dx[i], ny = temp.1 + dy[i] // 상하좌우 좌표
                    // 2차원 배열 안에 들어있고, 해당 집이 있는 경우에만 방문 처리 및 카운트 증가 처리
                    if (nx < 0 || nx >= n || ny < 0 || ny >= n) == false && graph[nx][ny] == 1 {
                        graph[nx][ny] = 0
                        count += 1
                        queue.append((nx, ny))
                    }
                }
                
            }
            resultCount += 1
            return count
        }
        
        
        for i in 0..<n {
            for j in 0..<n {
                if graph[i][j] == 1 {
                    result.append(bfs(i, j))
                }
            }
        }
        
        result.sort()
        
        print(resultCount) // result.count로 해도 됨
        for i in result {
            print(i)
        }
    }



    // !!!: DFS 구현 재귀함수
    func solution2(_ n: Int, _ arr: [[Int]]) {
        
        // 그래프, 결과 배열, 단지 갯수
        var graph = arr, result = [Int](), count = 0
        
        func cycle(_ x: Int, _ y: Int) -> Bool {
            if x <= -1 || x >= n || y <= -1 || y >= n { // 배열 범위 확인
                return false
            }
            
            if graph[x][y] == 1 {
                count += 1
                graph[x][y] = 0 // 방문 처리 => 다시 탐색 X
                let _ = cycle(x - 1, y)
                let _ = cycle(x, y - 1)
                let _ = cycle(x + 1, y)
                let _ = cycle(x, y + 1)
                return true
            }
            return false
        }
        
        for i in 0..<n {
            for j in 0..<n {
                if cycle(i, j) {
                    result.append(count)
                    count = 0
                }
            }
        }
        
        result.sort()
        
        print(result.count) // 답
        for i in result {
            print(i)
        }
        
    }
    
    
    func callBFS() {
        let input = ReadLine().getInt()
        var matrix = [[Int]]()

        for _ in 0..<input {
            matrix.append(ReadLine().getIntArray())
        }

        solution1(input, matrix)
    }
    
    func callDFS() {
        let mat = [[0, 1, 1, 0, 1, 0, 0],
                   [0, 1, 1, 0, 1, 0, 1],
                   [1, 1, 1, 0, 1, 0, 1],
                   [0, 0, 0, 0, 1, 1, 1],
                   [0, 1, 0, 0, 0, 0, 0],
                   [0, 1, 1, 1, 1, 1, 0],
                   [0, 1, 1, 1, 0, 0, 0]]

        solution2(7, mat)
    }
}
