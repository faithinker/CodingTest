//
//  Sol_76501.swift
//  CodingTest
//
//  Created by 김주협 on 2021/12/12.
//

import Foundation

// [프로그래머스 76501] 음양 더하기(https://programmers.co.kr/learn/courses/30/lessons/76501)

class Sol_76501 {
    
    func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
        var sum = 0
        
        // 방법 2. 변수를 바깥에서 만들고 연산하기 결과(실행시간,메모리) : 0.26ms 16.6MB
        absolutes.enumerated().forEach {
            if signs[$0.offset] {
                sum += $0.element
            } else {
                sum -= $0.element
            }
        }
        return sum
    }
}

// 함수 안에 이 로직 넣기
// 방법 1. reduce 함수를 써서 연산하기 결과(실행시간,메모리) 0.47ms 16.5MB
/*var result = absolutes.enumerated().reduce(0, { x, y in
    if signs[y.offset] {
        return x + y.element
    } else {
        return x - y.element
    }
})

return result */



