//
//  Sol_86051.swift
//  CodingTest
//
//  Created by 김주협 on 2021/10/16.
//

import Foundation


// [프로그래머스 86051] 없는 숫자 더하기(https://programmers.co.kr/learn/courses/30/lessons/86051)

// 생각의 전환
// (1부터 9까지 더한수) - (배열의 모든 수를 더한 것) = 답

class Sol_86051: Log {
    override init() {
        super.init()
        LOG(solution([1,2,3,4,6,7,8,0]))
    }
    
    func solution(_ numbers:[Int]) -> Int {
        var result = 45
        
        // 방법 1
        numbers.forEach {
           result -= $0
        }
        // 방법 2
    //    numbers.map { result -= $0 }
        
        // 다른사람 풀이
    //    45 - numbers.reduce(0, +)
        // numbers의 합을 다 더한다음 45에서 빼준다.
        
        return result
    }
}

// 다른 풀이 적용해보고 싶으면 나머지를 주석처리하고 run 하기
