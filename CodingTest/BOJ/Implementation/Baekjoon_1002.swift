//
//  Baekjoon_1002.swift
//  CodingTest
//
//  Created by pineone on 2022/05/25.
//

import Foundation


/// [백준 1002][실버4] 터렛(https://www.acmicpc.net/problem/1002)
/// https://velog.io/@aurora_97/백준-1002번-터렛-Swift
class Baekjoon_1002 {
    init() {
        for _ in 0..<Int(readLine()!)! {
            let tt = readLine()!.split(separator: " ").map{Int(String($0))!}
            let t = [0, 0, 3, 0, 7, 4]
            let (x1,y1,r1,x2,y2,r2) = (t[0],t[1],t[2],t[3],t[4],t[5])

            let d = sqrt(Double((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2)))

            print("\(r1-r2), d: \(d), \(r1+r2)")
            
            //두 원이 일치
            if x1 == x2 && y1 == y2 && r1 == r2 {
                print(-1)
            }
            //두 점에서 만난다
            else if Double(abs(r1-r2)) < d && d < Double(r1+r2) {
                print(2)
            }
            //한 점에서 만난다.
            else if Double(r1+r2) == d || Double(abs(r1-r2)) == d {
                print(1)
            }
            //만나지 않는다
            else {
                print(0)
            }
        }
    }
}


