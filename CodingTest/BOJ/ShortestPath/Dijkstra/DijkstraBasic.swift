//
//  DijkstraBasic.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/01.
//

import Foundation

class DijkstraBasic {
    


    
    // 이코테 최단 경로 알고리즘 55:22
    func call() {
        // n: 도시 갯수, m: 통로 갯수, c: 출발점
        let (n, m, c) = ReadLine().getThreeTupleInt()

        var graph = Array(repeating: Array<(Int, Int)>(), count: n+1)

        for _ in 0..<m {
            // x: 출발지, y: 도작지, z: 시간
            let (x, y, z) = ReadLine().getThreeTupleInt()
            graph[x].append((y, z))
        }
        
        solution(n, c, graph: graph)
        
        /*
        3 2 1
        1 2 4
        1 3 2
        Result: 2 4 받는 도시의 총 개수, 총 걸리는 시간
        */
    }

    
    func solution(_ n: Int, _ start: Int, graph: [[(Int, Int)]]) {
        var countryCount = 0
        var totalTime = 0
        
        var distance = Array(repeating: Int.max, count: n + 1)
        distance[start] = 0
        distance[0] = 0
        
        var pq = PriorityQueue<(Int, Int)> { $0.0 < $1.0 }
        pq.enqueue((0, start))
        
        while pq.isEmpty == false {
            let (curTime, curNode) = pq.dequeue()!
            
            if distance[curNode] < curTime { continue }
            //print("graph[\(curNode)]: \(graph[curNode])")
            for n in graph[curNode] {
                let (nextNode, nextTime) = (n.0, n.1)
                let sum = curTime + nextTime
                
                if distance[nextNode] > sum {
                    distance[nextNode] = sum
                    pq.enqueue((sum, nextNode))
                    countryCount += 1
                    totalTime = max(totalTime, sum)
                }
            }
        }
        
        //print("distance: \(distance) \t countryCount: \(countryCount) \t totalTime: \(totalTime)")
        
        print(countryCount, totalTime)
    }


    
}
