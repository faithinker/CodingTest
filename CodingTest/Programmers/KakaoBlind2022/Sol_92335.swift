//
//  Sol_92335.swift
//  CodingTest
//
//  Created by jhkim on 2022/11/18.
//

import Foundation


/*
 내가 이 문제를 88점 맞은 이유 => 데이터가 엄청 클때 이 값을 어떻게 소수 판별할것인가
 단순히 2/3/5의배수를 건너뛴다고 되지 않는다.
 타겟수를 `제곱근`으로 나눠서 진수를 판별하도록 하는 것이 핵심이다!!!
 ==> 소수 판별하는 방법을 빨리 검색했으면 좋았을 듯하다.
 
 제곱근을 사용하는 이유
 특정한 자연수 X가 소수인지 확인하기 위하여 가운데 약수까지만 '나누어떨어지는지' 확인하면 된다.
 
 소수 판별 : 제곱근, 에라토스테네스의 체
 https://velog.io/@changhee09/알고리즘-소수의-판별-에라토스테네스의-체
 
 해설 : https://velog.io/@minji0801/Swift-프로그래머스-Lv.2-k진수에서-소수-개수-구하기-2022-KAKAO-BLIND-RECRUITMENT
 https://fomaios.tistory.com/entry/Swift-2022-KAKAO-BLIND-RECRUITMENT-k진숫에서-소수-개수-구하기
 
 */

// [프로그래머스 92335][레벨 2] k진수에서 소수 개수 구하기 https://school.programmers.co.kr/learn/courses/30/lessons/92335
class Sol_92335 {
    
    init() {
        solution(437674, 3) // 3
        solution(110011, 10) // 2
    }
    
    
    
    func solution(_ n:Int, _ k:Int) -> Int {
        let radixNum = String(n, radix: k) // K진수 변환
        let nums = radixNum.split(separator: "0").filter { isDecimal(num: Int($0) ?? 1) }.count
        
        return nums
    }

    // 소수인지 체크하는 함수
    func isDecimal(num: Int) -> Bool {
        
        let nums = [2, 3, 5, 7]
        let checkNum = nums.map { num.isMultiple(of: $0) }.contains(true)
        
        if nums.contains(num) { // 2라면 소수
            return true
        } else if num == 1 || checkNum { // 1 또는 2의 배수라면 false
            return false
        } else {
            let sq = Int(sqrt(Double(num)))
            for i in stride(from: 11, through: sq, by: 2) {
                if num%i == 0 {
                    return false
                }
            }
        }
        return true
    }
    
    // 기존에 썼던 방식 매우 비효율적이다.
//            for i in stride(from: 3, through: num-1, by: 2) {
//                if num%i == 0 {
//                    return false
//                }
//            }
    
    
    // 다른 사람의 풀이 sq 변수가 핵심이다. 제곱함수 pow, 제곱근 함수 sqrt
    func isPrimeNumber(_ n:Int) -> Bool {
        if n == 1  { return false }
        if n == 2 || n == 3 {return true}
        let sq = Int(sqrt(Double(n)))
        for i in 2...sq {
            if n%i == 0 {
                return false
            }
        }
        return true
    }
}
