//
//  Baekjoon_10819.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/20.
//

import Foundation

// [백준 10819] 차이를 최대로 https://www.acmicpc.net/problem/10819 - 브루트포스, 백트래킹
// 순열 => 순서 고려
class Baekjoon_10819 {
    
    init() {
        call1()
        //call2()
    }

    func call1() {
        let input = ReadLine().getInt()
        let arr = ReadLine().getArrInt()
        print(solution(arr))
        //print(solution([20, 1, 15, 8, 4, 10]))
    }
    
    
    func solution(_ arr: [Int]) -> Int {
        
        var result = 0
        
        var visited = Array(repeating: false, count: arr.count)
        
        func cycle(_ now: [Int]) {
            if now.count == arr.count {
                var sum = 0
                for i in 0..<now.count-1 {
                    sum += abs(now[i] - now[i+1])
                }
                result = max(result, sum)
            }
            
            for i in 0..<arr.count {
                if visited[i] {
                    continue
                } else {
                    visited[i] = true
                    cycle(now + [arr[i]])
                    visited[i] = false
                }
            }
        }
        
        cycle([])
        
        return result
    }

    
    // 백준 맞힌 사람의 답안
    func call2() {
        perm(0)
        print(ans)
        
        let _ = ReadLine().getInt()
        let m = ReadLine().getArrInt()
        print(solution2(m))
    }
    
    /// n = 6, arr = 20 1 15 8 4 10
    /// result 62
    /// 둘 중 한개만 테스트 할려면 전역변수로 있는 readLine 삭제!
    let N = Int(readLine()!)!
    var A = readLine()!.split(separator: " ").map{Int(String($0))!}
    var ans = Int.min
    

    func perm(_ depth: Int) {
        if depth == N {
            var sum = 0
            for i in 1..<N {
                sum += abs(A[i-1]-A[i])
            }
            ans = max(ans, sum)
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
    func solution2(_ arr: [Int]) -> Int {
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
