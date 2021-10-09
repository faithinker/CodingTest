//
//  Test.swift
//  CodingTest
//
//  Created by pineone on 2021/10/09.
//

/// Sol번호가 아니라 Sol_번호인 이유는
/// 템플릿으로 파일명을 만들면 숫자 인식이 안되서 _ 씹히기 때문이다.

import Foundation

class Test: Log {
    
    override init() {
        super.init()
        LOG(solution())
    }
    
    func solution() -> String {
        
        return "TEST TEST"
    }
}
