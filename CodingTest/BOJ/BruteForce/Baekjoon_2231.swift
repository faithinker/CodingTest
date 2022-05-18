//
//  Baekjoon_2231.swift
//  CodingTest
//
//  Created by pineone on 2022/05/18.
//

import Foundation

/// 브루트포스 알고리즘 brute force
/// [백준 2231][브론즈2] 분해합(https://www.acmicpc.net/problem/2231)
class Baekjoon_2231 {
    
    init() {
        let num = ReadLine().getInt()
        print(solution(n: num))
    }
    
    func solution(n: Int) -> Int {
        
        let arrInt: [Int] = String(n).map { Int(String($0))! }
        
        //print("arrInt : \(arrInt)")
        
        for i in n-arrInt.count*9..<n {
            var target = i
            var partSum = i
            while target != 0 {
                partSum += target%10
                target /= 10
            }
            //print(i, "분해합 :", partSum)
            
            if partSum == n {
                return i
            }
        }
        return 0
    }
    
    /// 부분합 = 대상 + 각자릿수별 값
    /// 각자릿수는 최대 9까지 올 수 있다.
    /// 1의 자리면 9*1, 10의 자리면 9*2...
}
