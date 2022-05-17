//
//  Baekjoon_1946.swift
//  CodingTest
//
//  Created by pineone on 2022/05/17.
//

import Foundation

/// 답 : https://icksw.tistory.com/78
/// https://apple-apeach.tistory.com/67
///

/// 서류: 1 4 / 4 2 / 6 1
/// 면접: 6 1 / 4 2 / 1 4
/// 문제 해석을 잘못했다...
/// 내가 잘못 생각한 이유...
/// 1. 순위를 점수로 잘못생각해 숫자가 높을수록 좋은것이라 생각했다.
/// 2. `다른 모든 지원자와 비교했을 때` 서류심사 성적과 면접시험 성적 중 적어도 하나가 다른 지원자보다 떨어지지 않는 자만 선발한다.
/// => 이 조건을 `모든 지원자`가 아닌 특정한 지원자 한명만 이겨도 된다고 생각함

/// [백준 1946][실버1] 신입사원(https://www.acmicpc.net/problem/1946)
class Baekjoon_1946 {
    
    init() {
        runLoop(num: ReadLine().getInt())
    }

    func solution(n: Int, list: [(Int, Int)]) -> Int {
        //let test = [(3,2), (1,4), (4,1), (2,3), (5,5)]
        
        let newSort = list.sorted(by: { $0.0 < $1.0 })
        var min = n
        var result = 0
        
        for (document, interview) in newSort {
            if document == 1 {
                result += 1
                min = interview
            } else {
                if interview == 1 {
                    result += 1
                    break
                } else {
                    if min > interview {
                        min = interview
                        result += 1
                        //print(min)
                    }
                }
            }
        }
        return result
    }
    
    func runLoop(num: Int) {
        var result = [Int]()
        
        for _ in 0..<num {
            let n = ReadLine().getInt() // 지원자의 숫자
            let personalGrade = ReadLine().multipleWithIntTuple(num: n)
            
            result.append(solution(n: n, list: personalGrade))
        }
        result.forEach {
            print($0)
        }
    }
}
