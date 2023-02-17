//
//  Sol_150370.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/17.
//

import Foundation



/// [프로그래머스 150370] 개인정보 수집 유효기간 https://school.programmers.co.kr/learn/courses/30/lessons/150370
class Sol_150370 {
    
    func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {

        let todays: [Int] = today.components(separatedBy: ".").map { Int($0) ?? 0 }
        let privacies: [[String]] = privacies.map { $0.components(separatedBy: " ")}
        var termsDictionary: [String : Int] = [:]
        var result: [Int] = []
        
        /// date가 파기해야할 개인정보인지 확인
        func isExpireable(_ date: String, _ terms: Int) -> Bool {
            let dates: [Int] = date.components(separatedBy: ".").map { Int($0) ?? 0 }

            // 연 -> 일, 월 -> 일, 동일한 일 형태로 맞추기
            let todayDay: Int = todays[0] * 12 * 28 + todays[1] * 28 + todays[2]
            let datesDay: Int = dates[0] * 12 * 28 + dates[1] * 28 + dates[2]

            return todayDay > datesDay + terms * 28 - 1 ? true : false
        }

        for term in terms { // 약관 종류에 따른 유효기간
            let terms: [String] = term.components(separatedBy: " ")
            termsDictionary[terms[0]] = Int(terms[1]) ?? 0
        }

        for index in 0..<privacies.count { // 순회
            if isExpireable(privacies[index][0], termsDictionary[privacies[index][1]] ?? 0) {
                result.append(index + 1)
            }
        }

        return result
    }
    
    func call() {
        solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]) // [1, 3]
        solution("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"]) // [1, 4, 5]
    }
}
