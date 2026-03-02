//
//  FirstUnique.swift
//  CodingTest
//
//  Created by jhkim on 2026.03.01.
//

import Foundation

class FirstUnique {
    // [FirstUnique](https://app.codility.com/programmers/trainings/4/)
    // 1차 패스: 각 숫자가 몇 번 나오는지를 빠르게 기록해두기 (딕셔너리/해시맵 느낌)
    // 2차 패스: 배열을 앞에서부터 다시 보면서, 기록해둔 “등장 횟수”가 1인 첫 원소를 반환
    public func solution(_ A : inout [Int]) -> Int {
        
        // 숫자: (갯수, 자릿수)
        var dict: [Int: (Int, Int)] = [:]
        
        for i in 0..<A.count {
            if dict[A[i]] == nil {
                dict[A[i]] = (1, i)
            } else {
                let count = dict[A[i]]!.0
                dict[A[i]]!.0 = count+1
            }
        }
        
        //print("dict: \(dict)")
     
        // 딕셔너리는 순서대로 저장해서 1이 제일 처음 나온것이 답
        for dic in dict {
            if dic.value.0 == 1 {
                return dic.key
            }
        }
        return -1
    }


    // GPT 답
    public func solution1(_ A: inout [Int]) -> Int {
        var freq: [Int: Int] = [:] //
        for x in A { freq[x, default: 0] += 1 }
        for x in A { if freq[x] == 1 { return x } }
        return -1
    }

    var a = [4, 10, 5, 4, 2, 10] // 5
    var b = [1, 4, 3, 3, 1, 2] // 4
    var c = [6, 4, 4, 6] // -1
    var d = [1, 4, 3, 3, 1, 2] // 4
    var e = [1, 2, 3, 4] // 1



    //print(solution1(&a))
    //print(solution1(&b))
    //print(solution1(&c))
    //print(solution1(&d))
    //print(solution1(&e))

//    print(solution(&a))
//    print(solution(&b))
//    print(solution(&c))
//    print(solution(&d))
//    print(solution(&e))

}
