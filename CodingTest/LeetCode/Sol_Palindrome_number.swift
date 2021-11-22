//
//  Sol_Palindrome_number.swift
//  CodingTest
//
//  Created by pineone on 2021/11/22.
//

import Foundation

class Sol_Palindrome_number {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        } else {
            //  숫자 각 자리수마다 쪼개기
            let arr = String(x).map { Int(String($0))! }
            
            /// 가우스의 덧셈처럼 양끝의 차가 0이 되면 true이고 그렇지 않으면 false이다.
            /// 매 양끝마다의 차가 0이어야 한다.
            for i in 0..<arr.count/2 {
                //print("\(i) :: \(arr[i]) ||| \(arr.count-i-1) :: \(arr[arr.count-i-1])")
                
                if arr[i] != arr[arr.count-i-1] {
                    return false
                }
            }
            return true
        }
    }
}
