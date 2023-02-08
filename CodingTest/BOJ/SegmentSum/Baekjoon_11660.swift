//
//  Baekjoon_11660.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/08.
//

import Foundation

/// [백준 11660][실버1] 구간 합 구하기 5(https://www.acmicpc.net/problem/11660)
class Baekjoon_11660 {
    
    /// 제일 깔끔한 답안
    /// https://castlerain.tistory.com/100
    /// https://chanhuiseok.github.io/posts/baek-19/
    func solution2(_ n: Int, _ table: [[Int]], _ inputs: [[Int]]) {
        var graph = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
        
        for i in 1...n { // 세로
            for j in 1...n { // 가로
                // 이차원 누적합 구하기 = 세로 누적합 + 가로 누적합 - 세로와 가로의 겹친 부분 + 현재 값
                graph[i][j] = graph[i][j-1] + graph[i-1][j] - graph[i-1][j-1] + table[i-1][j-1]
            }
        }
        
        for input in inputs {
            // 부분 누적합 = 누적값 - 세로 이전값 - 가로 이전값 + 이전값들의 겹친 부분
            let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
            print(graph[x2][y2] - graph[x1-1][y2] - graph[x2][y1-1] + graph[x1-1][y1-1])
        }
    }

    func call3() {
        let graphs = [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6], [4, 5, 6, 7]]
        let areas = [[2, 2, 3, 4], [3, 4, 3, 4], [1, 1, 4, 4]]
        solution2(4, graphs, areas)
    }

    
    /// 내가 처음 생각한 답
    func solution(_ n: Int, _ graphs: [[Int]], _ area: [[Int]]) {
        var graph = Array(repeating: Array(repeating: 0, count: n+1), count: n+1) //graphs
        
        for i in 1...n {
            var lineSum = 0
            for j in 1...n { // 가로만 누적합을 한 상태
                lineSum += graphs[i-1][j-1]
                graph[i][j] = lineSum
            }
        }
        
        //Helper().logMatrix(graph)
        
        for arr in area {
            let (a, b, c, d) = (arr[0], arr[1], arr[2], arr[3])
            
            var s = 0
            var e = 0

            for i in a...c { // (세로 누적합) - (세로 시작-1 누적합) ==> 그래프가 가로 누적만 돼있으므로...
                s += graph[i][d]
                e += graph[i][b-1]
            }
            //print("s: \(s) @@ e: \(e)", "s-e=", s-e)
            
            print(s-e)
        }
    }
    
    
    func call1() {
        let (n, m) = ReadLine().getTwoTupleInt()
        
        var graph = [[Int]]()
        
        for _ in 0..<n {
            let line = ReadLine().getArrInt()
            graph.append(line)
        }
        
        
        
        var area = [[Int]]()
        
        for _ in 0..<m {
            let line = ReadLine().getArrInt()
            area.append(line)
        }
        
//        print("graph: \(graph)")
//        print("=================")
//
//        print(area)
        
        //solution(n, graph, area)
        solution2(n, graph, area)
    }
    


    func call2() { // 미리 예제까지 전부 입력. 호출만 하면 됨
        let graphs1 = [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6], [4, 5, 6, 7]]
        let area1 = [[2, 2, 3, 4], [3, 4, 3, 4], [1, 1, 4, 4]]
        solution(4, graphs1, area1)


        solution(2, [[1, 2], [3, 4]], [[1, 1, 1, 1], [1, 2, 1, 2], [2, 1, 2, 1], [2, 2, 2, 2]])
    }

}
