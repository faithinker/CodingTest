//
//  Sol_87389.swift
//  CodingTest
//
//  Created by jhkim on 2022/11/18.
//

import Foundation

// [프로그래머스 87389][레벨 1] 나머지가 1이 되는 수 찾기 https://school.programmers.co.kr/learn/courses/30/lessons/87389
class Sol_87389: Log {
    
    override init() {
        super.init()
        
        let t = solution(10)
        let tt = solution(12)
        
        print("t: \(t), tt: \(tt)")
    }

    func solution(_ n:Int) -> Int {
    
        for i in 1..<n {
            if n%i == 1 {
                return i
            }
        }
    
        return 0
    }
    

}
