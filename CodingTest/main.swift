//
//  main.swift
//  CodingTest
//
//  Created by JoohyupKim on 2021/09/13.
//
// 그동안 푼 알고리즘 네이버 블로그에 업로드 한 기록 :
// https://blog.naver.com/rlawnguq12/222499589480
// [프로그래머스 문제번호] 제목(링크)
//
// 문제 기록 방법
// 1. 파일 만들기 (파일명: _문제번호)
// 2. 파일에 클래스 -> Sol 함수 -> init 호출 작성
// 3. main 파일에서 호출하기 클래스명.init() 또는 클래스명().self
// * 코드만 쓰지 말고 나의 사고과정, 추론이유, 남의 풀이법 비교해서 주석 설명하기!!!
// ** README 작성하기!!
//
// LeetCode 기록 작성법
// 함수이름 또는 url을 파일명으로 만들기
// 함수 이름 위에 주석으로 문제명, 문제url 달기

import Foundation

//var log: [Any] = [Test.init(), Sol_86491().self]

//_ = Sol_86491(); _ = Sol_86051()

// MARK: - LeetCode
//print(Palindrome_number().isPalindrome(1000021))
//print(Two_Sum().twoSum([2,7,11,15], 9) // OUTPUT: [0,1]

// MARK: - 프로그래머스
//print(Sol_12973().solution("baabaa"))
//print(Sol_12911().solution(78)) // result 83

// MARK: 백준
// print(Baekjoon_5585())
// 런해서 예시 입력값을 cmd창에서 직접 입력해야함
// 백준은 함수명, 입력값과 출력값 모두 작성해줘야 한다.

/*
 Swift ReadLine https://didu-story.tistory.com/177
 추후에 자주쓰는 extension 따로 파일로 만들어서 호출하자!!
 
 팁 : 여러줄 출력할때 String으로 합친다음
 var result = "\(Value)\n"
 result.removeLast() 해주는게 좋다!
 */

/// 알고리즘 출처 : https://github.com/raywenderlich/swift-algorithm-club/tree/master/Heap

/// 브루트포스 알고리즘 brute force
/// [백준 1065][실버4] 한수(https://www.acmicpc.net/problem/1065)
/// [백준 14501][실버3] 퇴사(https://www.acmicpc.net/problem/14501)
/// [백준 9663][골드5] N-Queen(https://www.acmicpc.net/problem/9663)
/// [백준 1018][실버5] 체스판 다시 칠하기(https://www.acmicpc.net/problem/1018)


/// [프로그래머스 92341] 주차 요금 계산 https://school.programmers.co.kr/learn/courses/30/lessons/92341 -

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
    
    //print("car info: \(dic)")
    //print("car sumUseTime @@ : \(timeTable)")

    let sorted = timeTable.sorted(by: {
        $0.key < $1.key
    })
    
    var result = sorted.map {
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

solution(fees1, records1) // [14600, 34400, 5000]


/*
 1. 들어오고 나가고 해서 총 시간부터 계산
 2-1. 기본시간 이하라면, 기본시간만 청구
 2-2. 기본시간 이상이라면,  기본시간 + [(주차시간 - 기본시간) / 단위시간] x 단위요금
        * [] 올림 처리
 3. 차량번호대로 정렬하여 배열 리턴
 
 
 */


