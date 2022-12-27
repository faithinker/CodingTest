//
//  Baekjoon_2178.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/27.
//

import Foundation

/// [백준 2178][실버1] 미로 탐색(https://www.acmicpc.net/problem/2178)
/// https://velog.io/@sun02/Swift-백준-2178-미로탐색
/// 최단거리 ==> BFS
/// 가는 방향마다 1씩 누적합?
class Baekjoon_2178 {

    func solution(_ goal: [Int], _ mat: [[Int]]) -> Int {
        
        var graph = mat
        
        let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
        
        func bfs(_ x: Int, _ y: Int) -> Int {
            var queue: [(Int, Int)] = [(x, y)]
            
            while !queue.isEmpty {
                let temp = queue.removeFirst()
                for i in 0..<4 {
                    let nx = temp.0 + dx[i], ny = temp.1 + dy[i] // 상하좌우 좌표
                    // 2차원 배열 안에 들어있고, 해당 길이 있는 경우에만 방문 처리 및 카운트 증가 처리
                    if nx >= 0 && nx < goal[0] && ny >= 0 && ny < goal[1]  && graph[nx][ny] == 1 {
                        graph[nx][ny] = graph[temp.0][temp.1] + 1
                        queue.append((nx, ny))
                    }
                }
            }
            return graph[goal[0] - 1][goal[1] - 1]
        }
        
        return bfs(0, 0)
    }

    func call() {
        let input = ReadLine().getArrInt()

        var matrix = [[Int]]()

        for _ in 0..<input[0] {
            matrix.append(ReadLine().getIntArray())
        }

        let s1 = solution(input, matrix)
        print(s1)

    }

    func autoCall() {
        let mat = [[1, 0, 1, 1, 1, 1],
                   [1, 0, 1, 0, 1, 0],
                   [1, 0, 1, 0, 1, 1],
                   [1, 1, 1, 0, 1, 1]]

        let mat2 = [[1, 1, 0, 1, 1, 0],
                    [1, 1, 0, 1, 1, 0],
                    [1, 1, 1, 1, 1, 1],
                    [1, 1, 1, 1, 0, 1]]

        let s2 = solution([4, 6], mat2)
        print(s2)
    }
}
