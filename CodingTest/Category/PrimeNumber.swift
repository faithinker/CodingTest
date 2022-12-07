//
//  PrimeNumber.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/07.
//

import Foundation

/*
 소수를 판단하는 두가지 방법
 1. 제곱근 사용
 2. 에라토스토네스의 체 => N 이전의 모든 소수를 구해줌
 
 */

class PrimeNumber {
    
    init() {
        print(countPrime(26))
    }
    
    /// 에라토스토네스의 체 사용
    func countPrime(_ n: Int) -> [Int] {
        var arr = [Int]()
        for i in stride(from: 2, through: n, by: 1) {
            arr.append(i)
        }
        
        return recursive(0, arr)
    }
    
    func recursive(_ index: Int, _ arr: [Int]) -> [Int] {
        var result = arr.filter { $0.isMultiple(of: arr[index]) == false }
        result.insert(arr[index], at: index)
        
        if index+1 < result.count {
            return recursive(index+1, result)
        } else {
            return result
        }
    }

    /// 제곱근 소수 판별
    func isPrimeNumber(_ n:Int) -> Bool {
        if n == 1  { return false } // 4의 제곱근까지는 전부 1로 나와 직접 소수 계산
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

