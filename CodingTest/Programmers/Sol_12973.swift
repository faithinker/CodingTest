//
//  Sol_12973.swift
//  CodingTest
//
//  Created by pineone on 2021/11/24.
//

import Foundation

// [프로그래머스 12973] 짝지어 제거하기(https://programmers.co.kr/learn/courses/30/lessons/12973)

// 생각의 전환
// 문자 쪼개기 할 때, 현재 배열에 있는 문자와 뒤에 들어오는 문자 같은지 다른지 비교하기

class Sol_12973 {
    
    func solution(_ s:String) -> Int{
        var stack = [String.Element]()
        
        for i in s {
            if stack.count > 0, stack.last == i {
                stack.removeLast()
//                print("remove :", stack)
            } else {
                stack.append(i)
//                print("append :", stack)
            }
        }
        
        return stack.count > 0 ? 0 : 1
    }
}

