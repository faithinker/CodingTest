//
//  Baekjoon_2661.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/22.
//

import Foundation

/// [백준 2661][실버5] 좋은수열(https://www.acmicpc.net/problem/2661)
/// 7자리가 되는 모든 경우의 수 => 백트래킹 가지치기로 안되면 바로 중단 => 처음 나오는 값이 제일 작음
/// 모든 경우의 수 : 3^80 ==> 시간초과
/// 가지치기 기준 : 기존 1개와 중복, 기존 2개와 중복
/// 해설 : https://seokjin2.tistory.com/86
class Baekjoon_2661 {

    // 80자리의 수일 경우 Int형으로 계산하면 overflow가 나기 때문에 String으로 계산해야한다!!
    init() {
        //let input = ReadLine().getInt()
        //let s1 = solution(input)

        let s2 = solution(80)
        print("result \(s2)")
    }
    
    
    func solution(_ num: Int) -> String {
        
        var result = ""
        
        func cycle(_ now: [String]) {
            if !result.isEmpty { return } // 값이 할당되면 이 값이 가장 작으므로 종료
            
            if now.count == num {
                result = now.joined()
                return
            }
            
            for i in ["1", "2", "3"] {
                let newList = now + [i]
                if check(newList) { // 백트래킹
                    cycle(newList)
                }
            }
        }
        
        cycle(["1"]) // 가장 작은수이기 때문에 앞자리는 무조건 1이여야만 한다.
        return result
    }


    func check(_ num: [String]) -> Bool {
        let len = num.count
        for i in 1...len/2 { // 끝의 2개를 비교하여, 길이를 1..<len/2까지 반복해서 똑같은지 체크한다.
            let left = num[len - i - i..<len - i]
            let right = num[len - i..<len]
            if left == right { return false }
        }
        return true
    }

}
