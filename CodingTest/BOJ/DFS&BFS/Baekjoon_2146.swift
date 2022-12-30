//
//  Baekjoon_2146.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/30.
//

import Foundation


/// [백준 2146][골드3] 다리 만들기(https://www.acmicpc.net/problem/2146)
/// 1. 섬 군락을 찾는다. => BFS/DFS
/// 2. 섬(바다 인접부분)과 섬사이의 모든 거리를 연결한다. => BFS 사용. 엣지 부분만 체크
/// ===> 다리 시작점 다리를 1개씩 놓으면서 상하좌우 다른 섬이 연결 가능한지 체크... 안되면 다음 다리 놓기
/// 3. BFS의 최솟값을 찾는다.
///
/// https://kyun2da.github.io/2021/04/22/makeBridge
class Baekjoon_2146 {
    
    /// 시간초과 발생 => 실패... 엣지만 계산되도록 하면 좋을 것 같다.
    func solution(_ n: Int, _ arr: [[Int]]) {
        var graph = arr
        let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
        
        var islands = [[(Int, Int)]]() // 각 섬들의 군락좌표
        
        func bfs(_ x: Int, _ y: Int, _ label: Int) { // 섬(군락) 라벨링
            var queue = [(x, y)]
            var area = [(x, y)]
            graph[x][y] = label
            
            while !queue.isEmpty {
                let (cx, cy) = queue.removeFirst()
                for i in 0..<4 {
                    let nx = cx + dx[i], ny = cy + dy[i] // 상하좌우 좌표
                    if (nx < 0 || nx >= n || ny < 0 || ny >= n) == false && graph[nx][ny] == 1 {
                        graph[nx][ny] = label
                        area.append((nx, ny))
                        queue.append((nx, ny))
                    }
                }
            }
            islands.append(area)
        }
        
        func bfsDistance(_ label: Int) -> Int { // 최단 거리 구하기
            var queue = islands[label - 2] // 군락을 큐에 담는다.
            var distance = Array(repeating: Array(repeating: Int.max, count: n), count: n)
            
            queue.forEach { x, y in // 현재 섬의 좌표를 0으로 만든다.
                distance[x][y] = 0
            }
            
            while !queue.isEmpty {
                let (cx, cy) = queue.removeFirst()
                
                for i in 0..<4 {
                    let nx = cx + dx[i], ny = cy + dy[i] // 상하좌우 좌표
                    
                    if nx < 0 || nx >= n || ny < 0 || ny >= n { // 배열 내부가 아니라면..
                        continue // 밑에 동작 X
                    }
                    
                    if graph[nx][ny] != 0 && graph[nx][ny] != label { // 다른 섬이라면
                        return distance[cx][cy]
                    }
                    if graph[nx][ny] == 0 { // 바다라면 거리 1씩 증가
                        distance[nx][ny] = distance[cx][cy] + 1
                        queue.append((nx, ny))
                    }
                }
            }
            return Int.max
        }
        
        var number = 2 // 입력을 1,0 두개로 받기 때문에 섬 라벨링을 2부터 시작
        
        for i in 0..<n {
            for j in 0..<n {
                if graph[i][j] == 1 {
                    bfs(i, j, number)
                    number += 1
                }
            }
        }
        
        var result = Int.max
        
        for i in 2..<number {
            result = min(result, bfsDistance(i))
        }
        
        print(result)
    }
    
    func call() {
        var input = ReadLine().getInt()
        var mat = [[Int]]()
        
        for _ in 0..<input {
            mat.append(ReadLine().getArrInt())
        }
        
        solution(input, mat)
    }
    
    
    func call2() {
        var mat2 = [[1, 1, 1, 0, 0, 0, 0, 1, 1, 1],
                    [1, 1, 1, 1, 0, 0, 0, 0, 1, 1],
                    [1, 0, 1, 1, 0, 0, 0, 0, 1, 1],
                    [0, 0, 1, 1, 1, 0, 0, 0, 0, 1],
                    [0, 0, 0, 1, 0, 0, 0, 0, 0, 1],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 1, 1, 0, 0, 0, 0],
                    [0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

        solution(10, mat2)
    }
    
    /// 각 섬 좌표마다 BFS 수행하는 것이 아니라 edge 부분만 배열에 담아서 절대값으로 거리를 구한다음 계산한다.
    func otherSolution() {
        
        func isRange(_ y: Int, _ x: Int) -> Bool {
            (0..<n) ~= y && (0..<n) ~= x
        }

        func numbering(_ y: Int, _ x: Int, _ number: Int) {
            var isEdge = false
            for i in 0..<4 {
                let ny = y+dy[i], nx = x+dx[i]
                if !isRange(ny, nx) { continue }
                if g[ny][nx] == 0 { isEdge = true }
                if g[ny][nx] != -1 { continue }
                g[ny][nx] = number
                numbering(ny, nx, number)
            }
            if isEdge { e.append((y, x)) }
        }

        let n = Int(readLine()!)!
        var g = [[Int]]()
        var e = [(Int, Int)]()
        var ans = Int.max
        let dy = [-1, 0, 1, 0], dx = [0, 1, 0, -1]

        for _ in 0..<n {
            g.append(readLine()!.split{$0==" "}.map{-1*Int(String($0))!})
        }

        var number = 1
        for i in 0..<n {
            for j in 0..<n where g[i][j] == -1 {
                g[i][j] = number
                numbering(i, j, number)
                number += 1
            }
        }

        for i in 0..<e.count {
            let (y1, x1) = e[i]
            for j in i+1..<e.count {
                let (y2, x2) = e[j]
                if g[y1][x1] == g[y2][x2] { continue }
                ans = min(ans, abs(y2-y1)+abs(x2-x1)-1)
            }
        }

        print(ans)
    }
}
