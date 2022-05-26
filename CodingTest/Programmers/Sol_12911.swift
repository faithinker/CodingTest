//
//  Sol_12911.swift
//  CodingTest
//
//  Created by 김주협 on 2021/12/12.
//

import Foundation


/// [프로그래머스 12911] 다음 큰 숫자(https://programmers.co.kr/learn/courses/30/lessons/12911)
class Sol_12911 {
    func solution(_ n: Int) -> Int {
        // 2진수로 변환한 String형 숫자
        var answer = String(n, radix: 2)
        // n의 2진수의 1의 갯수가 몇개인지 카운팅 하는 변수
        let count = answer.filter({ $0 == "1" }).count
        // 비교할 숫자
        var result = n + 1
        
        // n의 2진수의 1 갯수가, 다음수를 2진수로 변환했을때의 1의 갯수와 같을 때까지 반복문을 돌린다.
        while true {
            answer = String(result, radix: 2)
            if count == answer.filter({ $0 == "1" }).count {
                return result
            }
            result += 1
        }
    }
    
    
    // nonzeroBitCount : 2진수로 변환해 1의 갯수를 카운팅 해준다.
    func solution2(_ n:Int) -> Int {
        var answer : Int = n + 1

        while true {
            if n.nonzeroBitCount == answer.nonzeroBitCount {
                break;
            }
            answer += 1
        }

        return answer
    }
    
    
    /// 20220526 다시 문제풀이함
    func solution4(_ n:Int) -> Int {
        
        let nOneCount = oneCount(num: n)
    
        for i in n+1..<Int.max {
            if oneCount(num: i) == nOneCount {
                return i //print("result: \(i)")
            }
        }
        
        /// 2진수 변환 후, 1의 갯수 카운트 해주는 함수
        func oneCount(num: Int) -> Int {
            return String(num, radix: 2).map { String($0) }.filter { $0 == "1" }.count
        }
    
        return 0
    }
    
    
    // 동료 문제풀이
    
    var oneConut = Int.max
    // 2진수 직접 변환해서 1의 갯수 카운팅 하는 함수
    func divide(number: Int) -> Int {
        var count = 0
        var num = number
        while num != 0 {
            //print(num)
            if num % 2 == 1 { count += 1 }
            if count > oneConut {
                return -1
            }
            num /= 2
        }
        
        return count
    }
    
    func solution3(_ n:Int) -> Int {
        oneConut = divide(number: n)
        var addValue = 1
        var answer = 0
        while true {
            if oneConut == divide(number: n + addValue) { // 1의 갯수 비교
                answer = n + addValue
                break
            }
            addValue += 1
        }
        return answer
    }
}


/// 처음 생각....
/// 각 자릿수를 비교해서 두번째 1인곳을 바꿔치기 한다.
/// 만약 풀방이면 자릿수를 하나 늘린다.
///
/// 일단 가장 먼저 두번째 1의 앞에 있는 0을 1로 바꿔치기 한다.
/// 그러면 1이 5개가 된다. 내가 바꾼곳 다음번째에 0이 있는지 찾는다. 내가 1로 바꾼곳의 다음번째는 무조건0으로 바꾼다.
/// 0이 있으면 그곳을 1로 바꾼다. 단 0이 가장 끝에있는곳을 바꿔야 한다.
/// 1010011 1이 4개
/// 너무 깊게 생각했다... 단순하게 생각하자...
