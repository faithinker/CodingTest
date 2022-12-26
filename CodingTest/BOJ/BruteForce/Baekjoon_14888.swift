//
//  Baekjoon_14888.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/26.
//

import Foundation

/// [백준 14888][실버1] 연산자 끼워넣기(https://www.acmicpc.net/problem/14888)

class Baekjoon_14888 {
    
    init() {
        call()
    }
    
    func call() {

        let s1 = solution([5, 6], [0, 0, 1, 0])
        print("\(s1[0]) \n\(s1[1])")
        //solution([3, 4, 5], [1, 0, 1, 0])
        //solution([1, 2, 3, 4, 5, 6], [2, 1, 1, 1])


//        let input1 = ReadLine()
//        let input2 = ReadLine().getArrInt()
//        let input3 = ReadLine().getArrInt()
//
//        let output = solution(input2, input3)
//        print("\(output[0]) \n\(output[1])")
        
        
        //let result = calculate(a: 10, b: 5, operation: +)
        //print("result: \(result)")

    }

    func solution(_ a: [Int], _ b: [Int]) -> [Int] {
        
        var maxValue = Int.min
        var minValue = Int.max
        
        func cycle(_ oper: [String], _ list: [Int]) {
            if oper.count == a.count-1 {
                var sum = a[0]
                
                for j in 1..<a.count {
                    switch oper[j-1] {
                    case "0": sum += a[j]
                    case "1": sum -= a[j]
                    case "2": sum *= a[j]
                    default: sum /= a[j]
                    }
                }
                maxValue = max(maxValue, sum)
                minValue = min(minValue, sum)
                
                return
            }
            
            for i in 0..<list.count { // 사칙연산(+-*/) => 0123 으로 변환
                if list[i] == 0 {
                    continue
                }
                var temp = list
                temp[i] -= 1
                
                var tempOper = oper
                tempOper.append(String(i))
                
                cycle(tempOper, temp)
            }
        }
        
        cycle([], b)
        
        return [maxValue, minValue]
    }

    func calculate(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
      return operation(a, b)
    }
}
