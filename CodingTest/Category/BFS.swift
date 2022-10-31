//
//  BFS.swift
//  CodingTest
//
//  Created by jhkim on 2022/10/25.
//

import Foundation

class BFS {
    
    
    init() {
        
    }
    
    // 출처: https://nareunhagae.tistory.com/56
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
        
        var queue = Queue<Int>() // 큐 => FIFO
        
        func bfs(start: Int) {
            queue.enqueue(start) // 시작점 큐에 넣기
            visited[start] = true // 시작점 방문으로 체크
            
            while !queue.isEmpty { // 큐가 빈값이 될때까지 반복 수행한다.
                guard let elem = queue.dequeue() else { return }
                print(elem, terminator: " ")
                
                for i in graph[elem] { // 연결된 노드들을 전부 탐색한다.
                    if !visited[i] { // 연결된 노드가 이전에 방문하지 않았다면, 큐에 추가한다. 그리고 방문처리를 바꾼다.
                        queue.enqueue(i)
                        visited[i] = true
                    }
                }
            }
        }
        
        // 데이터 입력 및 시작
        bfs(start: 1) // 1 2 3 4 5 6 7 8
    }
    
    // 출처 : https://www.youtube.com/watch?v=7C9RgOcvkvo
    func youtubeExample() {
        var graph = [[],
                     [2, 3, 8], // 1번 node
                     [1, 7], // 2번 node
                     [1, 4, 5], // 3번 node
                     [3, 5], // 4번 node
                     [3, 4], // 5번 node
                     [7], // 6번 node
                     [2, 6, 8], // 7번 node
                     [1, 7] // 8번 node
        ]
        
        var visited = Array(repeating: false, count: 9)
        
        var queue = Queue<Int>()
        
        func bfs(_ start: Int) {
            queue.enqueue(start)
            visited[start] = true
            
            while !queue.isEmpty {
                guard let v = queue.dequeue() else { return }
                print(v, terminator: " ")
                
                for i in graph[v] {
                    if !visited[i] {
                        queue.enqueue(i)
                        visited[i] = true
                    }
                }
            }
        }
    }
    

    

    
    
    func solution() {
        let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
        let n = firstLine[0]
        let m = firstLine[1]
        
        var maze = [[Int]]()
        
        for _ in 0..<n{
            maze.append(readLine()!.map({Int(String($0))!}))
        }
        
        // 방문한 노드인지 확인하는 배열
        var visited:[[Int]] = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
        // BFS에 필요한 큐
        var queue: [[Int]] = [[0,0]]
        
        let dx: [Int] = [0,0,-1,1] // 상하좌우
        let dy: [Int] = [-1,1,0,0] // 상하좌우
        
        // 시작점에서 어떤 노드에 도달하기 위한 바로 직전의 노드
        var predecessor: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [-1,-1], count: m), count: n)
        predecessor[0][0] = [0,0]
        
        // 시작점에서 어떤 노드에 도달하는 거리
        var distance: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        distance[0][0] = 1
        
        print("maze: \(maze)")
        print("Visited: \(visited)")
        print("Start predecessor : \(predecessor)")
        
        while queue.count != 0 {
            let now = queue.remove(at: 0)
            
            print("now: \(now)")
            
            // 방문하지 않은 노드만 확인
            if visited[now[0]][now[1]] == -1 {
                visited[now[0]][now[1]] = 1
                for i in 0..<dx.count {
                    let nowdx = now[0] - dx[i]
                    let nowdy = now[1] - dy[i]
                    
                    if nowdx < 0 || nowdx > n-1 || nowdy < 0 || nowdy > m-1{ //공간 벗어나면 무시
                        continue
                    } else {
                        
                        
                        if maze[nowdx][nowdy] == 1 && visited[nowdx][nowdy] == -1{ //갈수 있고 방문한적 없는 경우에만
                            print("nowdx: \(nowdx), nowdy: \(nowdy)")
                            
                            predecessor[nowdx][nowdy] = now
                            distance[nowdx][nowdy] = distance[now[0]][now[1]] + 1 // 거리값 증감
                            queue.append([nowdx,nowdy])
                        }
                    }
                }
            }
        }
        
        print("distance : \(distance)")
        print("predecessor: \(predecessor)")
        
        print(distance[n-1][m-1])
    }
    
}


