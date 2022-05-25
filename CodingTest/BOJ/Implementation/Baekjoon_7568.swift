//
//  Baekjoon_7568.swift
//  CodingTest
//
//  Created by pineone on 2022/05/25.
//

import Foundation


/* 배열이 1로 시작하면 숫자 증가 // 5로 시작하면 숫자 감소
 단, 덩치 우열 가릴 수 없을때 그대로 진행한다!
 1. 몸무게, 키 모두 큰 경우
 2. 몸무게, 키 모두 작은 경우
 3. 1번과 2번이 아닌경우
 */

/// 구현 + 브루트포스(완전탐색)
/// [백준 7568][실버4] 덩치(https://www.acmicpc.net/problem/7568)
class Baekjoon_7568 {
    init() {
        print(solution())
    }
    
    func solution() -> String {
        struct Info {
            var weight: Int
            var height: Int
        }
        
        var people = [Info]()
        
        for _ in 0..<Int(readLine()!)! {
            let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
            people.append(Info(weight: arr[0], height: arr[1]))
        }
        
        var arr = Array(repeating: 1, count: people.count)
        
        for i in 0..<arr.count-1 {
            for j in i+1..<arr.count {
                let f = people[i]
                let s = people[j]
                if f.weight > s.weight && f.height > s.height { // 내가 상대방보다 덩치가 큰 경우
                    arr[j] += 1 // 상대방만 숫자 증가시킴
                } else if f.weight >= s.weight || f.height >= s.height {
                    continue // 서로 덩치의 우열을 가릴 수 없는 경우, 한쪽이 같더라도 우열 가릴수 없다!!
                } else { // 내가 덩치가 작은 경우
                    arr[i] += 1 // 나의 숫자만 증가시킨다.
                }
            }
        }
        return arr.map { String($0) }.joined(separator: " ")
    }
}
