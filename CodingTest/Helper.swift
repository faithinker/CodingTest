//
//  Helper.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/12.
//

import Foundation

class Helper {
    // 2차원 배열을 입력받고 예쁘레 프린팅하기  ReadLine().matrixInt()
    func lintPrint(_ x: [[Int]]) {
        for i in x {
            if i == x[0] {
                print("[", terminator: "")
            }
            if i != x[x.count-1] {
                print(i, terminator: ",")
                print("")
            } else {
                print(i, terminator: "]")
                print("")
            }
        }
    }
}
