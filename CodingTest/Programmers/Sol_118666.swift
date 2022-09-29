//
//  Sol_118666.swift
//  CodingTest
//
//  Created by jhKim on 2022/09/29.
//

import Foundation

/// [프로그래머스 118666] 성격 유형 검사하기 https://school.programmers.co.kr/learn/courses/30/lessons/118666
/// 


/*
 1. 전체 survey for문 돌리기
 
 2. 두 수를 쪼개서 한방향 결정
 => 반복문을 끝까지 돌린다.
 => updateValue를 하기 때문에 여러개의 같은 지표 성격 유형 검사지가 나와도 따로 안더해도 된다.
 
 3. 각 n번 지표에서 우선순위 매겨서 결과값을 더한다.
 3-1 조건문 : 단, 하나의 지표에서 각 성격 유형 점수가 같으면, 두 성격 유형 중 사전 순으로 빠른 성격 유형을 검사자의 성격 유형이라고 판단
 
 Tip. 처음 문제 풀 때,1번의 전체 survey를 돌려서 확인하는 것이 아니라,
 특정 타겟을 먼저 두고서 제대로 값을 출력하는지 확인한 다음 전체 for문을 돌린다!!
 */

class Sol_118666 {

    init() {
        let survey1 = ["AN", "CF", "MJ", "RT", "NA"]
        let choices1 = [5, 3, 2, 7, 5] // Result : "TCMA"

        let survey2 = ["TR", "RT", "TR"]
        let choices2 = [7, 1, 3] // Result : "RCJA"

        print("result:", solution(survey1, choices1))
    }


    func solution(_ survey:[String], _ choices:[Int]) -> String {
        var dic = ["R" : 0, "T" : 0,
                   "C" : 0, "F" : 0,
                   "J" : 0, "M" : 0,
                   "A" : 0, "N" : 0]
        
        for i in 0..<survey.count {
            let type = survey[i].map { String($0) }
            
            switch choices[i] {
            case 1:
                dic.updateValue(dic[type[0]]! + 3, forKey: type[0])
            case 2:
                dic.updateValue(dic[type[0]]! + 2, forKey: type[0])
            case 3:
                dic.updateValue(dic[type[0]]! + 1, forKey: type[0])

            case 5:
                dic.updateValue(dic[type[1]]! + 1, forKey: type[1])
            case 6:
                dic.updateValue(dic[type[1]]! + 2, forKey: type[1])
            case 7:
                dic.updateValue(dic[type[1]]! + 3, forKey: type[1])

            default:
                break
            }
        }
        
        var result = dic["R"]! >= dic["T"]! ? "R" : "T"
        result.append(dic["C"]! >= dic["F"]! ? "C" : "F")
        result.append(dic["J"]! >= dic["M"]! ? "J" : "M")
        result.append(dic["A"]! >= dic["N"]! ? "A" : "N")
        
        //print("result :", dic, "\nresult: \(result)")
        
        return result
    }
}



// 다른 사람 아이디어 더 깔끔하다!
//switch choices[i] {
//case 1...3: // 가운데 점수 - 내가 선택한 선택지 = 점수
//    dic[type[0]] = dic[type[0]]! + 4 - choices[i]
//case 5...7: // 내가 선택한 선택지 - 가운데 점수 = 점수
//    dic[type[1]] = dic[type[1]]! + choices[i] - 4
//default:
//    break
//}
