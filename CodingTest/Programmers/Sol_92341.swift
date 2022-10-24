//
//  Sol_92341.swift
//  CodingTest
//
//  Created by jhkim on 2022/10/24.
//

import Foundation

/// [프로그래머스 92341] 주차 요금 계산 https://school.programmers.co.kr/learn/courses/30/lessons/92341 - 2022 KAKAO BLIND RECRUITMENT

class Sol_92341 {
    
    /*
     1. 들어오고 나가고 해서 총 시간부터 계산
     2-1. 기본시간 이하라면, 기본시간만 청구
     2-2. 기본시간 이상이라면,  기본시간 + [(주차시간 - 기본시간) / 단위시간] x 단위요금
            * [] 올림 처리
     3. 차량번호대로 정렬하여 배열 리턴
     */
    
    var fees1 = [180, 5000, 10, 600]
    var records1 = ["05:34 5961 IN",
                    "06:00 0000 IN",
                    "06:34 0000 OUT",
                    "07:59 5961 OUT",
                    "07:59 0148 IN",
                    "18:59 0000 IN",
                    "19:09 0148 OUT",
                    "22:59 5961 IN",
                    "23:00 5961 OUT"]

    var fees2 = [120, 0, 60, 591]
    var records2 = ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]

    var fees3 = [1, 461, 1, 10]
    var records3 = ["00:00 1234 IN"]
    
    init() {
        //solution(fees1, records1) // [14600, 34400, 5000]
        solution(fees2, records2) //[0, 591]
        solution(fees3, records3) // [14841]
    }
    
    func solution(_ fees:[Int], _ records:[String]) -> [Int] {
        
        var dic = [String: [String]]()
        
        var timeTable = [String: Int]()
        
        for i in 0..<records.count {
            let info = records[i].split(separator: " ").map { String($0) }
            //print("\(i)번째 : \(info)")
            
            if let dicValue = dic[info[1]] {
                var tempArr = dicValue
                tempArr.append(info[0])
                
                dic.updateValue(tempArr, forKey: info[1])
            } else {
                dic.updateValue([info[0]], forKey: info[1])
            }
        }
        
        for key in dic.keys {
            
            var sumTest = 0
            
            for i in stride(from: dic[key]!.count-1, through: 0, by: -2) {
                //print("\(key) : \(dic[key]![i])")
                
                if !dic[key]!.count.isMultiple(of: 2) { // 홀수개인 경우, 마지막 출차 X
                    if i == dic[key]!.count-1 { // 24시간 - 마지막 시간
                        sumTest += substractTime(first: "23:59", second: dic[key]![i])
                    } else { // 나머지 시간차 계산
                        sumTest += substractTime(first: dic[key]![i+1], second: dic[key]![i])
                    }
                } else { // 짝수일 경우 시간차 계산
                    sumTest += substractTime(first: dic[key]![i], second: dic[key]![i-1])
                }
            }
            
            timeTable.updateValue(sumTest, forKey: key)
        }
        
    //    print("car info: \(dic)")
    //    print("car sumUseTime @@ : \(timeTable)")

        let sorted = timeTable.sorted(by: {
            $0.key < $1.key
        })
        
        var result: [Int] = sorted.map {
            if $0.value < fees[0] {
                return fees[1]
            } else { // 기본시간 + [(주차시간 - 기본시간) / 단위시간] x 단위요금    단) 소수점 올림처리!
                return fees[1] + Int(ceil(Double(($0.value - fees[0])) / Double(fees[2]))) * fees[3]
            }
        }
        
        return result
    }

    func substractTime(first: String, second: String) -> Int {
        
        let firstTime = first.split(separator: ":").map { Int($0)! } //[6, 34]
        let secondTime = second.split(separator: ":").map { Int($0)! } //[6, 0]
        
        var hour = firstTime[0] - secondTime[0]
        
        var minute = firstTime[1] - secondTime[1]
        
        if minute < 0 {
            hour -= 1
            minute += 60
        }
        
        return hour * 60 + minute
    }
}
