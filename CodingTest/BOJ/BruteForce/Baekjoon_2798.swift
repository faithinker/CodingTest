//
//  Baekjoon_2798.swift
//  CodingTest
//
//  Created by pineone on 2022/05/18.
//

import Foundation

// 조합 : 서로 다른 n개중에 r개를 선택하는 경우의 수
/// [백준 2798][브론즈2] 블랙잭(https://www.acmicpc.net/problem/2798)
class Baekjoon_2798 {

    init() {
        call()
    }
    
    func call() {
        //let input = ReadLine().getArrInt()
        //let m = input[1]
        //let array = ReadLine().getArrInt()
        //print(solution(m, arr: array))
        let s1 = solution(21, arr: [5, 6, 7, 8, 9])
        //let s2 = solution(500, arr: [93, 181, 245, 214, 315, 36, 185, 138, 216, 295])
        print(s1)
    }
    
    // 조합 ==> 순서 상관 X
    func solution(_ standard: Int, arr: [Int]) -> Int {
        
        var result = 0
        
        func cycle(_ index: Int, _ now: [Int]) {
            if now.count == 3 {
                let sum = now.reduce(0) { $0 + $1 }
                
                if sum <= standard && sum > result {
                    result = sum
                }
                return
            }
            
            for i in index..<arr.count {
                print("now: \(now) @@ \(arr[i])")
                cycle(i + 1, now + [arr[i]])
            }
        }
        
        cycle(0, [])
        
        return result
    }
    
    
    func call2() {
        let n = ReadLine().getArrInt()
        let cardList = ReadLine().getArrInt()
        
        print(solution(m: n[1], list: cardList))
        
        //print(solution(m: 21, list: [5, 6, 7, 8, 9]))
        //print(solution(m: 500, list: [93, 181, 245, 214, 315, 36, 185, 138, 216, 295]))
    }
    
    func solution(m: Int, list: [Int]) -> Int {
        
        var result = 0
        
        for first in 0..<list.count {
            for second in first+1..<list.count {
                for third in second+1..<list.count {
                    let now = list[first] + list[second] + list[third]
                    if now == m {
                       return now
                    } else if now < m && now > result {
                        result = now
                    }
                }
            }
        }
        return result
    }
}
