//
//  Baekjoon_11659.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/08.
//

import Foundation


/*
 구간합 : https://medium.com/알고리즘은-미친짓이다/14-누적합-배열-prefix-sum-array-a0fe58f6f93
 끝까지의 누적합 - 처음 `전`까지의 누적합
 */

/// [백준 11659][실버3] 구간 합 구하기 4(https://www.acmicpc.net/problem/11659)
class Baekjoon_11659 {

    func solution(_ n: Int, _ arr: [Int], _ distance: [[Int]]) {
        var table = Array(repeating: 0, count: n+1)
        
        for i in 1...n {
            table[i] = table[i-1] + arr[i-1]
        }
        
        //print("table: \(table)")
        
        for i in distance {
            print(table[i[1]] - table[i[0]-1])
        }
        
    }
    
    func call() {
        let (n, m) = ReadLine().getTwoTupleInt()

        let arr = ReadLine().getArrInt()
        var graph = [[Int]]() //Array(repeating: Array<Int>() , count: n)

        for _ in 0..<m {
            let input = ReadLine().getArrInt()
            graph.append(input)
        }

        solution(n, arr, graph)
        
        
        // 예제를 미리 입력한 값
        let s1 = [[1, 3], [2, 4], [5, 5]]
        solution(5, [5, 4, 3, 2, 1], s1)
    }


}
