//
//  Baekjoon_12865.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/19.
//

import Foundation


/// [백준 12865][골드5] 평범한 배낭(https://www.acmicpc.net/problem/12865)
/// 배낭문제 (knapsack) 냅색
/// 냅색 문제는 두 개의 n, m 인풋이 들어오고 이 두개를 곱한 만큼의 메모리가 필요한 경우가 많다.
/// Swift : https://icksw.tistory.com/126
/// Java  : https://st-lab.tistory.com/141
/// https://www.youtube.com/watch?v=frlRE7bRIDo
/// 목적 : 가방안의 가치를 최대화
/// 모든 경우의 수를 다 해봐야 한다. 2^n 그러나 이렇게 하면 시간초과가 발생한다.
/// 그렇다면.. DP = Cache를 사용해서 이전에 만든 값을 저장하여 시간을 획기적으로 줄인다.
/// 결론 : 조합(Combi) + DP 으로 해결!!
class Baekjoon_12865 {
    
    
    
    
    
    func solution() {
        let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
        let n = firstLine[0]
        let k = firstLine[1]
        
        // 튜플의 배열
        var weight:[(Int, Int)] = []
        
        for _ in 0..<n {
            let tmp = readLine()!.split(separator: " ").map({Int(String($0))!})
            weight.append((tmp[0], tmp[1]))
        }
        
        var dp:[Int] = Array(repeating: 0, count: k + 1)
        for i in 0..<n {
            for j in stride(from: k, to: 0, by: -1) {
                if j >= weight[i].0 {
                    dp[j] = max(dp[j], dp[j - weight[i].0] + weight[i].1)
                }
            }
        }
        
        print(dp[k])
    }

    
    func call() {
        solution()
    }
    
    
    /// n : 물품 수, k : 무게, wArr : 물건들의 무게, vArr : 물건들의 가치
    func solution2(_ n: Int, _ k: Int, _ wArr: [Int], _ vArr: [Int]) -> Int {
        
        //var helper = Helper()
        
        // n이 세로, k가 가로 갯수(무게 최대 값)
        var dp = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)
        
    //    var count = 0
        
        /// i : Index,  w : 현재 무게
        func cycle(_ i: Int, _ w: Int) -> Int {
            
    //        count += 1
            
            //print("\(count)번째 ", helper.matrix("dp", i, w), "= \(dp[i][w]),", "n: \(n)")
            
            if dp[i][w] > 0 { // 값이 있으면 기존 값을 사용한다.
                return dp[i][w]
            }
            
            if i == n { // 종료 조건 갯수가 4개가 되면 끝낸다.
                return 0
            }
            
            var n1 = 0
            let n2 = cycle(i + 1, w) // 미포함
            
            if w + wArr[i] <= k { // 더할 무게가 최대 무게이하여야만 더한다.
                n1 = vArr[i] + cycle(i + 1, w + wArr[i]) // 포함
            }
            
            //print(helper.matrix("dp", i, w), "= \(n1) : \(n2)")
            
            dp[i][w] = max(n1, n2)
            
            return dp[i][w]
        }
        
        let result = cycle(0, 0)
        
        //helper.logMatrix(dp)
        
        return result
    }

    func call2() {
        let n = 4
        let k = 7

        let mat1 = [[6, 13],
                    [4, 8],
                    [3, 6],
                    [5, 12]]

        let arr = [6, 4, 3, 5]
        let arrV = [13, 8, 6, 12]

        let s2 = solution2(4, 7, arr, arrV) //solution2(n, k, arr, arrV)
        print(s2)


        //let nk = ReadLine().getArrInt()
        //let n = nk[0], k = nk[1]
        //
        //let list = ReadLine().matrixInt(n)
        //
        //var arr = [Int]()
        //var arrV = [Int]()
        //
        //for v in list {
        //    arr.append(v[0])
        //    arrV.append(v[1])
        //}
        //
        //let s = solution2(n, k, arr, arrV)
        //print(s)
    }

    
    
    /// https://icksw.tistory.com/126
    func solution1(_ n: Int, _ k: Int, _ arr: [[Int]]) -> Int {
        // dp[i] = 배낭의 무게 i
        var dp = Array(repeating: Array(repeating: 0, count: k+1), count: n)
        
        for i in 0..<n {
            for j in 1...k {
                if i == 0 { // 첫 번째 물건 일 때
                    if j >= arr[i][0] { // 현재 고려하는 무게가 현재 무게 보다 크면 그냥 그 무게가 최대값
                        dp[i][j] = arr[i][1]
                    }
                } else {
                    if j < arr[i][0] {
                        //print("\(j) < \(arr[i][0])")
                        dp[i][j] = dp[i-1][j]
                        //print("[\(i)][\(j)] : \(dp[i-1][j])")
                        //Helper().lintPrint(dp)
                    } else {
                        // 이부분 이해안감 다시하자!!
                        print("[\(i)][\(j)] : \(dp[i-1][j]), \(arr[i][1]) + \(dp[i-1][j-arr[i][0]])")
                        
                        dp[i][j] = max(dp[i-1][j], arr[i][1] + dp[i-1][j-arr[i][0]])
                    }
                }
            }
        }
        // 현재 고려하는 무게가 현재 무게 보다 크면
        // max(현재 물건 가치 + (지금 고려하는 무게 - 현재 물건 무게)에서의 가치, 현재 까지 지금 무게에서의 최대값)
        
        Helper().lintPrint(dp)
        
        return 0
    }

    
    func call1() {
        let n = 4
        let k = 7

        let mat1 = [[6, 13],
                    [4, 8],
                    [3, 6],
                    [5, 12]]


        let s1 = solution1(n, k, mat1)
        print(s1)
    }
    
}
