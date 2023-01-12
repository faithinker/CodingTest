//
//  GoldMine.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/12.
//

import Foundation

// 금광 52분 30초

/*
 0번째는 스킵
 n = n + n - 1  가장 큰값
 n - 1 누적합
 
 현재 위치에서 왼쪽의 아래, 가운데, 위  들어오는 3가지 경우 중 가장 큰값과 현재 배열값을 더해 갱신한다.
 
 j == 0   => 가운데, 아래
 j == 마지막 => 가운데, 위
 
 */
class GoldMine {
    func solution(_ x: Int, _ y: Int, _ arr: [[Int]]) -> Int {
        var mat = arr
        
        for i in 1..<y {
            for j in 0..<x {
                if j == 0 { // 이전 값의 가운데와 아래만 누적합
                    mat[j][i] += max(mat[j][i-1], mat[j+1][i-1])
                } else if j == x - 1 { // 이전 값의 가운데와 위만
                    //print("mat[\(j)][\(i)] : \(mat[j][i])")
                    mat[j][i] += max(mat[j-1][i-1], mat[j][i-1])
                } else { // 아래, 가운데, 위 모두
                    mat[j][i] += max(mat[j][i-1], mat[j+1][i-1], mat[j][i-1])
                }
            }
        }
        
        var result = 0
        for i in 0..<x {
            //print("mat[\(i)][\(y-1)] : \(mat[i][y-1])")
            result = max(result, mat[i][y-1])
        }
        
        return result
    }

    // nadongbin answer
    func solution2(_ x: Int, _ y: Int, _ arr: [[Int]]) -> Int {
        
        var mat = arr
        
        for j in 1..<y {
            for i in 0..<x {
                var leftUp = 0, leftDown = 0, left = 0
                if i != 0 {
                    leftUp = mat[i-1][j-1]
                }
                if i != x-1 {
                    leftDown = mat[i+1][j-1]
                }
                left = mat[i][j-1]
                mat[i][j] += max(leftUp, leftDown, left)
            }
        }
        
        var result = 0
        for i in 0..<x {
            result = max(result, mat[i][y-1])
        }
        
        return result
    }
    
    func call() {
        
        var mat1 = [[1, 3, 3, 2],
                    [2, 1, 4, 1],
                    [0, 6, 4, 7]]   // 19


        var mat2 = [[1, 3, 1, 5],
                    [2, 2, 4, 1],
                    [5, 0, 2, 3],
                    [0, 6, 1, 2]]   // 16
        
        print(solution(3, 4, mat1))
        print(solution(4, 4, mat2))
        
        //print(solution2(4, 4, mat2))
        //print(solution2(3, 4, mat1))
    }


}
