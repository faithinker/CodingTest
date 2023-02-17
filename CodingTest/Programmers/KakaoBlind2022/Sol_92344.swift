//
//  Sol_92344.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/14.
//

import Foundation


// 효용성 테스트
// 최대값 기준 : n = 1000, m = 1000, skill = 250,000
// skill 한번 board를 순회 할때 1000 * 1000 번 순회한다.
// O(1000 * 1000 * 250,000) -> 시간 초과
// => 핵심 skill을 N회로 끝내야한다.

// https://www.youtube.com/watch?v=MfNov_Osrt8
// https://tech.kakao.com/2022/01/14/2022-kakao-recruitment-round-1/
// https://kimjingo.tistory.com/155

// 1. skill 1회당 4개의 셀에 value를 setting => 행과 열에서 누적합을 계산할 줄 알아야함.
// 2. 모든 skill이 종료되면 각 셀마다 누적합을 계산 (1000 * 1000)
// O(250,000) + O(1,000,1000)  ~= O(1,000,000)



class Sol_92344 {
    
    init() {
        let s1 = solution2([[5,5,5,5,5], [5,5,5,5,5], [5,5,5,5,5], [5,5,5,5,5]],
                 [[1,0,0,3,4,4], [1,2,0,2,3,2], [2,1,0,3,1,2], [1,0,1,3,3,1]]) // 10

        let s2 = solution2([[1,2,3], [4,5,6], [7,8,9]],
                 [[1,1,1,2,2,4], [1,0,0,1,1,2], [2,2,0,2,0,100]]) // 6
        
        print("result: \(s1) @@ \(s2)")
    }
    
    // 정확성 O, 효율성 X
    func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
        
        var boards = board
        
        for i in 0..<skill.count {
            for m in skill[i][1]...skill[i][3] {
                for n in skill[i][2]...skill[i][4] {
                    if skill[i][0] == 1 { // 건물 파괴
                        boards[m][n] -= skill[i][5]
                    } else { // 건물 회복
                        boards[m][n] += skill[i][5]
                    }
                }
            }
        }
        return boards.flatMap { $0 }.filter { $0 > 0 }.count
    }

    // 정확성 O, 효율성 O
    func solution2(_ board:[[Int]], _ skill:[[Int]]) -> Int {
        var boards = board
        
        var tmp = Array(repeating: Array(repeating: 0, count: board[0].count + 1), count: board.count + 1)
        
        for sk in skill {
            let r1 = sk[1], c1 = sk[2], r2 = sk[3], c2 = sk[4]
            let degree = sk[0] == 1 ? -sk[5] : sk[5]
            
            tmp[r1][c1] += degree           // 좌상단
            tmp[r1][c2 + 1] += -degree      // 우상단 => 좌상단과 반대값
            tmp[r2 + 1][c1] += -degree      // 좌하단 => 좌상단과 반대값(열 누적합 할시)
            tmp[r2 + 1][c2 + 1] += degree   // 우하단 => 좌하단과 반대
        }
        
        for i in 0..<tmp.count - 1 { // 행
            for j in 0..<tmp[0].count - 1 {
                tmp[i][j+1] += tmp[i][j]
            }
        }
        
        for j in 0..<tmp[0].count - 1 { // 열
            for i in 0..<tmp.count - 1 {
                tmp[i + 1][j] += tmp[i][j]
            }
        }
        
        var result = 0
        
        // 기존 배열과 총 계산
        for i in 0..<boards.count {
            for j in 0..<boards[0].count {
                boards[i][j] += tmp[i][j]
                if boards[i][j] > 0 {
                    result += 1
                }
            }
        }
        
        return result
    }
}
