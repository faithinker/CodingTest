//
//  Baekjoon_1715.swift
//  CodingTest
//
//  Created by pineone on 2022/05/17.
//

import Foundation

/// [백준 1715][골드4] 카드 정렬하기(https://www.acmicpc.net/problem/1715)
class Baekjoon_1715 {
    
    init() {
//        let num = ReadLine().getInt()
//        let n = ReadLine().multipleNewLine(num: num)
//        print(solution(list: n))
        
        
        //print(solution(list: [10, 20, 40, 50, 60]))// 220
        //print(solution(list: [99]))
    }
    
    /// 답 : https://woongsios.tistory.com/266

    /// 카드가 N묶음이 있으면... 무조건 N-1번 덧셈이 필요하다..
    /// 1번째 실행시 가장 작은 수가 나와야 한다..
    /// 즉 오름차순 정렬 실행 후
    /// 10 + 20
    /// 30 + 40
    /// 70 + 50
    /// 재귀적인 덧셈을 한다. => 누적합
    /// 10: 2, 20: 2 40: 1
    /// 10: 3, 20: 3 40: 2, 50: 1

    func solution(list: [Int]) -> Int {
        let newList = list.sorted()
        
        var accumulate = 0
        
        var accumulateArr = [Int]()
        
        var result = 0
        
        for value in newList {
            accumulate += value
            accumulateArr.append(accumulate)
        }
        
        result = newList.count == 1 ? newList[0] : (accumulateArr.reduce(0) { $0 + $1 } - accumulateArr[0])
        //print(accumulateArr)
        return result
    }



}
