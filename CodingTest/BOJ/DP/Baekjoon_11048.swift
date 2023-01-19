//
//  Baekjoon_11048.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/18.
//

import Foundation

/// [백준 11048][실버2] 이동하기(https://www.acmicpc.net/problem/11048)
/// 하, 우, 우하단 대각선으로만 움직일 수 있음
/// 하지만 우하단 대각선으로 한번에 움직이는 것보다
/// 하, 우를 통해 들어오는게 무조건 숫자가 더 크기 때문에 하, 우만 고려
class Baekjoon_11048 {

    func solution(_ x: Int, _ y: Int, _ mat: [[Int]]) -> Int {
        var table = mat
        
        for i in 0..<x {
            for j in 0..<y {
                if i == 0 && j > 0 { // 0번째 가로줄
                    table[i][j] += table[i][j-1]
                }
                
                if j == 0 && i > 0 { // 0번째 세로줄
                    table[i][j] += table[i-1][j]
                }
                
                if j > 0 && i > 0 {
                    table[i][j] += max(table[i][j-1], table[i-1][j])
                }
            }
        }
        
        //Helper().lintPrint(table)
        
        return table[x-1][y-1]
    }

    let mat1 = [[1, 2, 3, 4],
                [0, 0, 0, 5],
                [9, 8, 7, 6]]

    let mat2 = [[1, 0, 0],
                [0, 1, 0],
                [0, 0, 1]]

    let mat3 = [[1, 2, 3],
                [6, 5, 4],
                [7, 8, 9],
                [12, 11, 10]]

    func call() {
        let s1 = solution(3, 4, mat1)
        print("===================")
        //let s2 = solution(3, 3, mat2)
        //print("===================")
        //let s3 = solution(4, 3, mat3)
        //
        //print(s1, s2, s3)
    }
    
    func call2() {
        let arr = ReadLine().getArrInt()
        let (n,m) = (arr[0], arr[1])
        let mat = ReadLine().matrixInt(n)
        let sol = solution(n, m, mat)
        print(sol)
    }


    // 다른 사람 풀이. 시간은 별차이가 안난다.
    func solution2(_ n: Int, _ m: Int, _ mat: [[Int]]) -> Int {
        // table을 1 크게 더 만든다.
        var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
        
        // 0번째 가로줄과 0번째 세로줄도 계산이 되게끔 처리한다. 어차피 그전의 값이 0이라 상관이 없다.
        for i in 1...n {
            for j in 1...m {
                dp[i][j] = mat[i-1][j-1] + max(dp[i-1][j], dp[i][j-1])
            }
        }
        
        Helper().lintPrint(dp)
        
        return dp[n][m]
    }
    
    func call3() {
        let s8 = solution2(3, 4, mat1)
        print(s8)
    }

}
