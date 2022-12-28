//
//  Baekjoon_14502.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/28.
//

import Foundation

/// [백준 14502][골드4] 연구소(https://www.acmicpc.net/problem/14502)
/// 1. DFS로 벽 3개를 추가한 그래프 모든 경우의 수 만들기
/// 2. 1번의 결과 그래프로 BFS로 바이러스를 최대한 살포시키키
/// 3. 각 그래프에 남은 0의 갯수 카운팅하기
/// 4. 최댓값 도출
class Baekjoon_14502 {

    func solution(_ n: Int, _ m: Int, _ arr: [[Int]]) -> Int {
        
        var graph = arr, result = Int.min
        let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
        
        var queue = [(Int, Int)]()
        
        for i in 0..<arr.count { // 바이러스가 존재하는 곳 큐에 담기
            for j in 0..<arr[0].count {
                if graph[i][j] == 2 {
                    queue.append((i, j))
                }
            }
        }
        
        func bfs() { // 바이러스 채운 다음, 0인 공간 카운팅하기
            var tempGraph = graph // 원형 그래프 보존
            var tempQueue = queue // 바이러스 리셋
            
            while !tempQueue.isEmpty {
                let temp = tempQueue.removeFirst()
                for i in 0..<4 {
                    let nx = temp.0 + dx[i], ny = temp.1 + dy[i] // 상하좌우 좌표
                    // 2차원 배열 안에 들어있고, 해당 길이 있는 경우에만 방문 처리 및 카운트 증가 처리
                    if nx >= 0 && nx < n && ny >= 0 && ny < m  && tempGraph[nx][ny] == 0 {
                        tempGraph[nx][ny] = 2
                        tempQueue.append((nx, ny))
                    }
                }
            }
            
            var count = 0
            
            for i in 0..<n {
                for j in 0..<m {
                    if tempGraph[i][j] == 0 {
                        count += 1
                    }
                }
            }
            
            result = max(result, count)
        }
        
        func newGraph(_ depth: Int) { // DFS 조합(순서 X)으로 벽세우기
            if depth == 3 {
                bfs()
                return
            }
            
            for i in 0..<n {
                for j in 0..<m {
                    if graph[i][j] == 0 {
                        graph[i][j] = 1
                        newGraph(depth + 1)
                        graph[i][j] = 0
                    }
                }
            }
        }
        
        newGraph(0)
        
        return result
    }

    func call1() {
        let input = ReadLine().getArrInt()

        var mat = [[Int]]()

        for _ in 0..<input[0] {
            mat.append(ReadLine().getArrInt())
        }

        print(solution(input[0], input[1], mat))
    }

    func call2() {
        var mat2 = [[2, 0, 0, 0, 1, 1, 0],
                    [0, 0, 1, 0, 1, 2, 0],
                    [0, 1, 1, 0, 1, 0, 0],
                    [0, 1, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 1, 1],
                    [0, 1, 0, 0, 0, 0, 0],
                    [0, 1, 0, 0, 0, 0, 0]]

        print(solution(7, 7, mat2))
    }




    /// 코드적으로 제일 깔끔 https://www.acmicpc.net/source/49570789 메모리[85020KB] 시간[120ms]
    func otherSolution() {
        
        func bfs(start: (Int, Int), map: inout [[Int]]) {
            
            var queue: [(Int, Int)] = [start]
            
            while !queue.isEmpty {
                let now = queue.removeFirst()
                
                // 위 아래 오른쪽 왼쪽
                let dx = [0, 0, 1, -1]
                let dy = [-1, 1, 0, 0]
                
                for i in 0..<4 {
                    let nx = dx[i] + now.0
                    let ny = dy[i] + now.1
                    
                    if ny < 0 || nx < 0 || ny >= n || nx >= m {
                        continue
                    }
                    
                    if map[ny][nx] == 0 {
                        map[ny][nx] = 2
                        queue.append((nx, ny))
                    }
                }
                
            }
        }

        func combi<T>(_ coor: [T], _ targetNum: Int) -> [[T]] {
            var result = [[T]]()
            
            func combination(_ index: Int, _ newCombi: [T]) {
                if newCombi.count == targetNum {
                    result.append(newCombi)
                    return
                }
                for i in index..<coor.count {
                    combination(i+1, newCombi + [coor[i]])
                }
            }
            
            combination(0, [])
            return result
        }

        func solution(map: [[Int]], combi: [[(Int, Int)]]) {
            
            var results : [Int] = []
            
            for newWall in combination {
                
                var map = map
                // 벽 세우기
                for wall in newWall {
                    map[wall.1][wall.0] = 1
                }
                
                // 바이러스 살포시작
                for visruse in visruses {
                    bfs(start: visruse, map: &map)
                }
                
                var count = 0
                for y in 0..<n {
                    for x in 0..<m {
                        if map[y][x] == 0 {
                            count += 1
                        }
                    }
                }
             
                results.append(count)
            }

            print(results.max()!)
        }

        
        
        
        
        
        
        let nm = readLine()!.split(separator: " ").map { Int($0)! }

        let n = nm[0]
        let m = nm[1]
        var map = [[Int]]()
        var visruses = [(Int, Int)]()
        var blackspace = [(Int, Int)]()

        for _ in 0..<n {
            map.append(readLine()!.split(separator: " ").map { Int($0)! })
        }

        for y in 0..<n {
            for x in 0..<m {
                if map[y][x] == 2 {
                    visruses.append((x, y))
                } else if map[y][x] == 0 {
                    blackspace.append((x, y))
                }
            }
        }




        let combination = combi(blackspace, 3)
        solution(map: map, combi: combination)
    }

}

