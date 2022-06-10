//
//  Sol_62048.swift
//  CodingTest
//
//  Created by jhKim on 2022/06/10.
//

import Foundation

// 빗선이 지나가는 사각형의 개수 : 가로 + 세로 - (가로 세로의 최대 공약수)
// [프로그래머스 62048] 멀쩡한 사각형(https://programmers.co.kr/learn/courses/30/lessons/62048)
class Sol_62048 {
    
    init() {
        print(solution(8, 12)) //60
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a%b)
    }

    func solution(_ w:Int, _ h:Int) -> Int {
        return  w * h - (w+h - gcd(w, h))
    }
}
