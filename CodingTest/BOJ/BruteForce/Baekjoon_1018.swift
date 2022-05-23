//
//  Baekjoon_1018.swift
//  CodingTest
//
//  Created by pineone on 2022/05/23.
//

import Foundation

/// [백준 1436][실버5] 영화감독 숌(https://www.acmicpc.net/problem/1436)

class Baekjoon_1018 {
    
    init() {
        solution(num: Int(readLine()!)!)
    }

    func solution(num: Int) {
        var count = 0
        for i in 666...10000000 {
            var n = i
            while n >= 666 {
                if n % 1000 == 666 {
                    count += 1
                    break
                }
                n /= 10
            }
            
            if count == num {
                print(i)
                break
            }
        }
    }
    
//    내가 생각한 답안... LLDB에서는 문제 없이 빌드되나, 백준 디버거로는 컴파일 에러가 발생한다!!
//    let n = Int(readLine()!)!
//    print(solution(n: n))
    func solution(n: Int) -> Int {
        
        var num = 0 // 몇번째 666인지 count
        var result = 0
        
        for i in 666..<Int.max {
            if String(i).contains("666") {
                num += 1
                
                if num == n {
                    result = i
                    break
                }
            }
        }
        //print(num, "result : \(result)")
        return result
    }



}
