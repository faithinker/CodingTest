//
//  App01.swift
//  CodingTest
//
//  Created by jhkim on 2023/02/07.
//

import Foundation


/*
 let (n, m) = (2, 3)//ReadLine().getTwoTupleInt()


 var a = Array(0..<n)

 // 위 설명문 For Swift
 for i in stride(from: n-1, to: 0, by: -1) {
     let j = Int.random(in: 0...i)
     a.swapAt(i, j)
     //print(i)
 }

 // 아래 설명문 For Swift
 func rand() -> Int {
     return Int.random(in: 0...m-1)
 }

 for i in stride(from: n-1, to: 0, by: -1) {
     let randValue = rand()
     let j = randValue % (i + 1)
     a.swapAt(i, j)
 }
 */


class App01 {
    
    
    func solution(_ n: Int, _ m: Int) {
        
        var arr = Array(0..<n)
        
        var count = [[Int]: Int]() // 배열(키) : 갯수(밸류)
        
        var result = [(Int, String)]()
        
        for i in stride(from: n-1, to: 0, by: -1) {
            var j = 0
            for k in 0...m-1 {
                j = k % (i + 1)
                
                arr.swapAt(i, j)
                print("i:\(i) --- k:\(k) ==> j:\(j) @@@ \(arr)")
                count.updateValue((count[arr] ?? 0) + 1, forKey: arr)
                arr = Array(0..<n)
            }

        }
        
        print("count: \(count)")

        count.forEach { key, value in
            let arraySum = key.map { String($0) }.joined()
            //print("\(value)/\(m)", arraySum)
            result.append((value, arraySum))
        }
        
        result.sort {
            if $0.0 > $1.0 { // 갯수가 많으면 앞으로
                return true
            } else if $0.0 == $1.0 { // 갯수가 같으면
                return Int($0.1)! > Int($1.1)!
            } else {
                return false
            }
        }
        
        print(result)
    }

    
    func call() {
        solution(2, 3)
        solution(3, 6)
        solution(3, 4)
    }

}
