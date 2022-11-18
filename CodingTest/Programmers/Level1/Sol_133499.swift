//
//  Sol_133499.swift
//  CodingTest
//
//  Created by jhkim on 2022/11/18.
//

import Foundation

// [프로그래머스 133499][레벨 1] 옹알이 (2) https://school.programmers.co.kr/learn/courses/30/lessons/133499
class Sol_133499: Log {
    
    override init() {
        super.init()
        
        solution1Log()
        solution2Log()
    }

    let data = ["aya", "ye", "woo", "ma"]

    func recursiveCheck(_ input: String, _ prev: String = "") -> Int {
        
        for i in data {
            if input.hasPrefix(i) {
                let sIndex = input.index(after: input.index(input.startIndex, offsetBy: i.count-1))
                let result = String(input[sIndex...])
                return prev == i ? 0 : recursiveCheck(result, i)
            }
        }
        
        return input == "" ? 1 : 0
    }

    func solution(_ babbling:[String]) -> Int {
        var count = 0
        
        let arr = babbling.filter { word in // 1. 접두어/접미어 체크
            var checkPrefix = false
            var checkSufix = false

            for i in data {
                if word.hasPrefix(i) {
                    if !checkPrefix {
                        checkPrefix = true
                    }
                }

                if word.hasSuffix(i) {
                    if !checkSufix {
                        checkSufix = true
                    }
                }

                if checkPrefix && checkSufix {
                    return true
                }
            }
            return false
        }
        
        for word in arr { //  2. 연속단어 체크 (재귀함수 이용)
            count += recursiveCheck(word)
        }
        
        return count
    }
    
    func solution1Log() {
        let s1 = solution(["aya", "yee", "u", "maa"])
        let s2 = solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"])
        
        print(s1, s2)
    }

    // 다른 사람 풀이법 => 더 간단하게도 풀 수 있다. 생각의 전환
    // 굳이 단어 인덱스 찾을 필요가 없다...

    func solution2(_ babbling:[String]) -> Int {
        var answer = 0
        for bab in babbling {
            let prons = ["aya", "ye", "woo", "ma"]
            var used: String = ""
            var block = ""
            for b in bab {
                block = block + String(b)
    //            print("block: \(block)" )
                if prons.contains(block) && used != block {
                    used = block
                    block = ""
                }
            }
    //        print("used: \(used)")
            if block == "" {
                answer = answer + 1
            }
        }

        return answer

    }

    func solution2Log() {
        let s1 = solution2(["aya", "yee", "u", "maa"])
        let s2 = solution2(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"])

        print(s1, s2)
    }
    
}
