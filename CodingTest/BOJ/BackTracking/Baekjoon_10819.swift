//
//  Baekjoon_10819.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/20.
//

import Foundation

// [백준 10819] 차이를 최대로 https://www.acmicpc.net/problem/10819 - 브루트포스, 백트래킹

class Baekjoon_10819 {
    
    init() {

        perm(0)
        print(ans)
        
        let n = ReadLine().getInt()
        let m = ReadLine().getArrInt()
        print(solution(m))
        
    }

    /// n = 6, arr = 20 1 15 8 4 10
    /// result 62

    
    /*
     속도 빠른 답안
     */
    
    let N = Int(readLine()!)!
    var A = readLine()!.split(separator: " ").map{Int(String($0))!}
    var ans = Int.min
    
    var count = 0

    func perm(_ depth: Int) {
        if depth == N {
            var sum = 0
            for i in 1..<N {
                sum += abs(A[i-1]-A[i])
            }
            ans = max(ans, sum)
            count += 1
            return
        }
        perm(depth+1)
        for i in depth+1..<N {
            A.swapAt(i, depth) // 순열 (자리바꿈)
            perm(depth+1) // 새로운 배열로 재귀함수 호출
            A.swapAt(i, depth) // 다음 i번째에 제대로 바뀔 수 있도록, 순열 원상 복구
        }
    }
    
    /*
     순열 배열을 만들고 한번 더 조회하기 때문에 성능상으로 좋지는 않다.
     */
    func solution(_ arr: [Int]) -> Int {
        var result = 0
    
        let permute = Permutation()
    
        for list in permute.permutation(arr, arr.count) {
            var sum = 0
            for i in 0..<list.count-1 {
                sum += abs(list[i] - list[i+1])
            }
            result = max(result, sum)
        }
    
        return result
    }
}
