//
//  Sol_12948.swift
//  CodingTest
//
//  Created by jhKim on 2022/05/09.
//

import Foundation

/// [프로그래머스 12948] 핸드폰 번호 가리기(https://programmers.co.kr/learn/courses/30/lessons/12948)
class Sol_12948 {
    func solution(_ num:String) -> String {
        // 끝에서 4번째 자리의 Index
        let newIndex = num.index(num.startIndex, offsetBy: num.count - 4)
        
        let result = String(num[newIndex...])
        
        // 뒷 4자리를 제외한 나머지 숫자의 * 갯수
        let star = String(repeating: "*", count: num.count - 4)
        
        return star + result
    }
    
    // 다른 사람 풀이 suffix 끝에서 4개만 취한다..
    func solution_2(_ phone_number:String) -> String {
        return String("\(String(repeating: "*", count: phone_number.count - 4))\(phone_number.suffix(4))")
    }
    
    init() {
        print(solution("01033334444"))
        print(solution("027778888"))
    }
}


