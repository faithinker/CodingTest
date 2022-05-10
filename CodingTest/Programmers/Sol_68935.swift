//
//  Sol_68935.swift
//  CodingTest
//
//  Created by pineone on 2022/05/10.
//

import Foundation

/// [프로그래머스 68935] 3진법 뒤집기(https://programmers.co.kr/learn/courses/30/lessons/68935)
class Sol_68935 {
    func solution(_ n:Int) -> Int {
        
        // 10진법 -> 3진법으로 변환후 배열에 담기
        let ternary: [String] = String(n, radix: 3).map { String($0) }
        
        var ternaryString = ""
        
        // 3진법을 하나의 문자열로 만들기
        for i in 0..<ternary.count {
            ternaryString += ternary[ternary.count-i-1]
        }
        
        let result = Int(ternaryString, radix: 3)!
        
        return result
    }
    
    init() {
        print(solution(45)) // 7
        print(solution(125)) // 229
    }
}




