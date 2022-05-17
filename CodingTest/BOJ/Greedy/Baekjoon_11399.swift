//
//  Baekjoon_11399.swift
//  CodingTest
//
//  Created by pineone on 2022/05/17.
//

import Foundation

/// [백준 11399][실버3] ATM(https://www.acmicpc.net/problem/11399)
class Baekjoon_11399 {
    
    init() {
        // 테스트 더미데이터 사실상 첫번째 입력 받는 n은 필요없다.
        //print(solution(list: [3, 1, 4, 3, 2]))
        //print(solution(n: 5, list: [3, 1, 4, 3, 2]))

        let n = ReadLine().getInt()
        //print(solution(list: ReadLine().getArrInt()))
        print(solution(n: n, list: ReadLine().getArrInt()))
    }
    
    func solution(n: Int? = nil, list: [Int]) -> Int {
        /// 정렬된 리스트
        let timeList = list.sorted()
        
        var result = 0
        
        /// [1 2 3]
        /// 1  |  1+2  | 1+2+3
        /// timeList[0]은 3번 반복, timeList[1] 2번반복..
        /// indexValue * (listCount - index)
        if var num = n {
            result = timeList.reduce(0) {
                // 이전 누적값, 새로들어오는 값
                // print("$0 : \($0) @@@@ $1 : \($1)")
                let result = $0 + $1*num
                num -= 1
                return result
            }
        } else { // 처음 생각한 답
            for i in 0..<timeList.count {
                result += timeList[i] * (timeList.count - i)
            }
        }
        
        return result
    }
}
