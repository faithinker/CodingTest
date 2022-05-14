//
//  Baekjoon_5585.swift
//  CodingTest
//
//  Created by jhKim on 2022/05/14.
//

import Foundation


/// [백준 5585][브론즈2] 거스름돈(https://www.acmicpc.net/problem/5585)
class Baekjoon_5585 {
    let number = Int(readLine()!)!
    
    init() {
        print(solution(coin: number))
    }
    
    func solution(coin: Int) -> Int {
        /// 잔돈 리스트
        let list = [500, 100, 50, 10, 5, 1]
        
        /// 거슬러줘야 하는 남은 돈
        var changes = 1000 - coin
        
        /// 잔돈의 갯수
        var result = 0
        
        for i in list {
            result += changes/i
            changes = changes%i
            
            if changes == 0 { // 더이상 거스름돈을 안줘도 된다면 for문 종료시킨다!
                break
            }
            
           //print(i, "@@" ,result, changes)
        }
        
        //print("Result: ", result, changes)
        
        return result
    }
    
    //solution(coin: 380)
    //solution(coin: 1)

    /*
                    500 100 50  10  5   1
    1000-380 = 620   1   1      2           => 4
    1000-1 =   999   1   4   1   4  1   4   => 15
     
     */
}



